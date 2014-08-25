/******************************************************************************
 *
 * cdtw_dist.c:
 *
 *   This is the C source code for a Matlab executable (MEX) function named
 *   cdtw_dist().  This function returns the Constrained (by Sakoe-Chiba band)
 *   Dynamic Time Warping distance between two time series.  This function has
 *   3 input parameters and 1 return value.
 *
 *     distance = cdtw_dist(query_vector, candidate_vector, radius);
 *
 *   The distance value is the square root of the minimum sum of squared
 *   differences divided by the number of comparisons.  If radius == Inf,
 *   distance is the unconstrained dynamic time warping distance.
 *
 *   Both the time and space complexity of this function are O(mn), where m
 *   is the length of the query_vector and n is the length of the
 *   candidate_vector.
 *
 *   This MEX function was tested using Matlab (R14SP1) for Windows with
 *   Matlab's Lcc C (v2.4).
 *
 *   These Matlab commands were used to compile this function:
 *     mex -setup;
 *     mex cdtw_dist.c;
 *
 *   Dave DeBarr; ddebarr(at)gmu.edu; Sep 17, 2006
 *
 ******************************************************************************/

#include "mex.h"
#include "matrix.h"
#include <stdlib.h>
#include <math.h>
#include <float.h>

#define  INDEX(s, r, c)  ((r) * (s) + (c))
#define  MIN(a, b)       (((a) < (b)) ? (a) : (b))
#define  MAX(a, b)       (((a) > (b)) ? (a) : (b))

/*
  Data Structures:  [A] = array;  [M] = matrix; [S] = scalar
    q  = [A] query time series
    c  = [A] candidate time series
    r  = [S] radius constraint
    d  = [S] dynamic time warping distance
    D  = [M] distance values (with one extra row and column)
    L  = [M] length   values (with one extra row and column)
    sd = [S] squared difference value
    nv = [A] neighboring values
    ql = [S] length of query time series
    cl = [S] length of candidate time series
    qi = [S] index for query time series (rows)
    ci = [S] index for candidate time series (columns)
    i  = [S] index for matrix
    p  = [A] permitted position end points
    ni = [A] neighboring index values
 */
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
    double *q, *c, *r, *d, *D, *L, sd, nv[3];
    int ql, cl, qi, ci, i, p[2], ni[3];

    /* check number of inputs and outputs */
    if (nrhs != 3) {
        mexErrMsgTxt("This function requires 3 input arguments.");
    } else if (nlhs > 1) {
        mexErrMsgTxt("This function only returns 1 output value.");
    }

    /* retrieve input arguments */
    q = mxGetPr(prhs[0]);    /* pointer to real values of first  argument  */
    c = mxGetPr(prhs[1]);    /* pointer to real values of second argument */
    r = mxGetPr(prhs[2]);    /* pointer to real value  of third  argument   */

    /* check series lengths */
    ql = mxGetNumberOfElements(prhs[0]);
    cl = mxGetNumberOfElements(prhs[1]);
    if (abs(ql - cl) > r[0]) {
        mexErrMsgTxt("Actual distance falls outside radius constraint.");
    }

    /* allocate memory for the return value */
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    d = mxGetPr(plhs[0]);    /* pointer to Matlab managed memory for result */

    /* initialize the distance and length matrices */
    D = (double *)mxMalloc((ql + 1) * (cl + 1) * sizeof(double));
    L = (double *)mxMalloc((ql + 1) * (cl + 1) * sizeof(double));
    i = INDEX(cl + 1, 0, 0);
    D[i] = 0;
    L[i] = 0;
    /* initialize the first row */
    for (qi = 1; qi <= ql; qi++) {
        i = INDEX(cl + 1, qi, 0);
        D[i] = DBL_MAX;
        L[i] = DBL_MAX;
    }
    /* initialize the first column */
    for (ci = 1; ci <= cl; ci++) {
        i = INDEX(cl + 1, 0, ci);
        D[i] = DBL_MAX;
        L[i] = DBL_MAX;
    }

    /* compute distance values */
    for (qi = 1; qi <= ql; qi++) {
        p[0] = MAX( 1, qi - r[0]);    /* minimum permitted position */
        p[1] = MIN(cl, qi + r[0]);    /* maximum permitted position */

        /* initialize values that precede permitted positions */
        for (ci = 1; ci < p[0]; ci++) {
            i = INDEX(cl + 1, qi, ci);
            D[i] = DBL_MAX;
            L[i] = DBL_MAX;
        }

        /* store distances for permitted positions */
        for (ci = p[0]; ci <= p[1]; ci++) {
            i     = INDEX(cl + 1, qi    , ci    );
            ni[0] = INDEX(cl + 1, qi - 1, ci - 1);    /* neighbor diagonal */
            ni[1] = INDEX(cl + 1, qi - 1, ci    );    /* neighbor above    */
            ni[2] = INDEX(cl + 1, qi    , ci - 1);    /* neighbor left     */
            sd    = (q[qi - 1] - c[ci - 1]) * (q[qi - 1] - c[ci - 1]);
            nv[0] = D[ni[0]];
            nv[1] = D[ni[1]];
            nv[2] = D[ni[2]];
            if (nv[0] < nv[1]) {
                if (nv[0] < nv[2]) {           /* min so far is diagonal   */
                    D[i] = sd + nv[0];
                    L[i] = L[ni[0]] + 1;
                } else if (nv[0] > nv[2]) {    /* min so far is left       */
                    D[i] = sd + nv[2];
                    L[i] = L[ni[2]] + 1;
                } else {                       /* diagonal or left         */
                    D[i] = sd + nv[0];
                    L[i] = MIN(L[ni[0]], L[ni[2]]) + 1;
                }
            } else if (nv[0] > nv[1]) {
                if (nv[1] < nv[2]) {           /* min so far is above      */
                    D[i] = sd + nv[1];
                    L[i] = L[ni[1]] + 1;
                } else if (nv[1] > nv[2]) {    /* min so far is left       */
                    D[i] = sd + nv[2];
                    L[i] = L[ni[2]] + 1;
                } else {                       /* above or left            */
                    D[i] = sd + nv[1];
                    L[i] = MIN(L[ni[1]], L[ni[2]]) + 1;
                }
            } else {
                if (nv[0] < nv[2]) {           /* diagonal or above        */
                    D[i] = sd + nv[0];
                    L[i] = MIN(L[ni[0]], L[ni[1]]) + 1;
                } else if (nv[0] > nv[2]) {    /* min so far is left       */
                    D[i] = sd + nv[2];
                    L[i] = L[ni[2]] + 1;
                } else {                       /* diagonal, left, or above */
                    D[i] = sd + nv[0];
                    L[i] = MIN(MIN(L[ni[0]], L[ni[1]]), L[ni[2]]) + 1;
                }
            }
        }

        /* initialize values that succeed permitted positions */
        for (ci = p[1] + 1; ci <= cl; ci++) {
            i = INDEX(cl + 1, qi, ci);
            D[i] = DBL_MAX;
            L[i] = DBL_MAX;
        }
    }

    /* store the normalized square root of the minimum distance */
    i = INDEX(cl + 1, ql, cl);
    d[0] = sqrt(D[i]) / L[i];
    mxFree(D);
    mxFree(L);
}
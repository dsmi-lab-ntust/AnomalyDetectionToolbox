say A is amatrix of scores
each column has the scores from somet method

calucalte similarity matrix
A = pdist( .... pearson )
    
now use
imshow(A)

and finally adjust title and axis

set(gca,'XAxisLocation','top'); % move x-axis to top
set(gca, 'XTicks' ....);
set(gca, 'YTicks', ...);
set(gca 'XTickLabels....
set(gca' YTickLabels ....);
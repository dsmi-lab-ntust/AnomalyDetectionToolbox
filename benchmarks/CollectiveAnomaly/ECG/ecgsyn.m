function [s, ipeaks] = ecgsyn(sfecg,N,Anoise,hrmean,hrstd,lfhfratio,sfint,ti,ai,bi)
% [s, ipeaks] = ecgsyn(sfecg,N,Anoise,hrmean,hrstd,lfhfratio,sfint,ti,ai,bi)
% Produces synthetic ECG with the following outputs:
% s: ECG (mV)
% ipeaks: labels for PQRST peaks: P(1), Q(2), R(3), S(4), T(5)
% A zero lablel is output otherwise ... use R=find(ipeaks==3); 
% to find the R peaks s(R), etc. 
% 
% Operation uses the following parameters (default values in []s):
% sfecg: ECG sampling frequency [256 Hertz]
% N: approximate number of heart beats [256]
% Anoise: Additive uniformly distributed measurement noise [0 mV]
% hrmean: Mean heart rate [60 beats per minute]
% hrstd: Standard deviation of heart rate [1 beat per minute]
% lfhfratio: LF/HF ratio [0.5]
% sfint: Internal sampling frequency [256 Hertz]
% Order of extrema: [P Q R S T]
% ti = angles of extrema [-70 -15 0 15 100] degrees
% ai = z-position of extrema [1.2 -5 30 -7.5 0.75]
% bi = Gaussian width of peaks [0.25 0.1 0.1 0.1 0.4]
% Copyright (c) 2003 by Patrick McSharry & Gari Clifford, All Rights Reserved  
% See IEEE Transactions On Biomedical Engineering, 50(3), 289-294, March 2003.
% Contact P. McSharry (patrick@mcsharry.net) or G. Clifford (gari@mit.edu)

%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
% 
% ecgsyn.m and its dependents are freely availble from Physionet - 
% http://www.physionet.org/ - please report any bugs to the authors above.

% set parameter default values
if nargin < 1
   sfecg = 256;
end
if nargin < 2
   N = 256;
end
if nargin < 3
   Anoise = 0;
end
if nargin < 4
   hrmean = 60;
end
if nargin < 5
   hrstd = 1;
end
if nargin < 6
   lfhfratio = 0.5;
end
if nargin < 7
   sfint = 512;
end
if nargin <8
    %     P  Q  R  S  T  
   ti = [-70 -15 0 15 100];
end
% convert to radians
ti = ti*pi/180;
if nargin <9 % z position of attractor
      %  P   Q   R   S   T   
   ai = [1.2 -5 30 -7.5 0.75];
end
if nargin <10 % Gaussian width of each attractor
    %    P    Q   R   S   T   
   bi = [0.25 0.1 0.1 0.1 0.4];
end

% adjust extrema parameters for mean heart rate 
hrfact =  sqrt(hrmean/60);
hrfact2 = sqrt(hrfact);
bi = hrfact*bi;
ti = [hrfact2 hrfact 1 hrfact hrfact2].*ti;

% check that sfint is an integer multiple of sfecg 
q = round(sfint/sfecg);
qd = sfint/sfecg;
if q ~= qd
   error(['Internal sampling frequency (sfint) must be an integer multiple ' ... 
'of the ECG sampling frequency (sfecg). Your current choices are: ' ... 
'sfecg = ' int2str(sfecg) ' and sfint = ' int2str(sfint) '.']);
end

% define frequency parameters for rr process 
% flo and fhi correspond to the Mayer waves and respiratory rate respectively
flo = 0.1;
fhi = 0.25;
flostd = 0.01;
fhistd = 0.01;

fid = 1;
fprintf(fid,'ECG sampled at %d Hz\n',sfecg);
fprintf(fid,'Approximate number of heart beats: %d\n',N);
fprintf(fid,'Measurement noise amplitude: %d \n',Anoise);
fprintf(fid,'Heart rate mean: %d bpm\n',hrmean);
fprintf(fid,'Heart rate std: %d bpm\n',hrstd);
fprintf(fid,'LF/HF ratio: %g\n',lfhfratio);
fprintf(fid,'Internal sampling frequency: %g\n',sfint);
fprintf(fid,'      P  Q  R  S  T\n'); 
fprintf(fid,'ti = [%g %g %g %g %g] radians\n',ti(1),ti(2),ti(3),ti(4),ti(5));
fprintf(fid,'ai = [%g %g %g %g %g]\n',ai(1),ai(2),ai(3),ai(4),ai(5));
fprintf(fid,'bi = [%g %g %g %g %g]\n',bi(1),bi(2),bi(3),bi(4),bi(5));


% calculate time scales for rr and total output
sampfreqrr = 1;
trr = 1/sampfreqrr; 
tstep = 1/sfecg;
rrmean = (60/hrmean);	 
Nrr = 2^(ceil(log2(N*rrmean/trr)));

% compute rr process
rr0 = rrprocess(flo,fhi,flostd,fhistd,lfhfratio,hrmean,hrstd,sampfreqrr,Nrr);

% upsample rr time series from 1 Hz to sfint Hz
rr = interp(rr0,sfint);

% make the rrn time series
dt = 1/sfint;
rrn = zeros(length(rr),1);
tecg=0;
i = 1;
while i <= length(rr)
   tecg = tecg+rr(i);
   ip = round(tecg/dt);
   rrn(i:ip) = rr(i);
   i = ip+1;
end 
Nt = ip;

% integrate system using fourth order Runge-Kutta
fprintf(fid,'Integrating dynamical system\n');
x0 = [1,0,0.04];
Tspan = [0:dt:(Nt-1)*dt];
[T,X0] = ode45('derivsecgsyn',Tspan,x0,[],rrn,sfint,ti,ai,bi);

% downsample to required sfecg
X = X0(1:q:end,:);

% extract R-peaks times
ipeaks = detectpeaks(X, ti, sfecg);

% Scale signal to lie between -0.4 and 1.2 mV
z = X(:,3);
zmin = min(z);
zmax = max(z);
zrange = zmax - zmin;
z = (z - zmin)*(1.6)/zrange -0.4;

% include additive uniformly distributed measurement noise 
eta = 2*rand(length(z),1)-1;
s = z + Anoise*eta;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rr = rrprocess(flo, fhi, flostd, fhistd, lfhfratio, hrmean, hrstd, sfrr, n)
w1 = 2*pi*flo;
w2 = 2*pi*fhi;
c1 = 2*pi*flostd;
c2 = 2*pi*fhistd;
sig2 = 1;
sig1 = lfhfratio;
rrmean = 60/hrmean;
rrstd = 60*hrstd/(hrmean*hrmean);

df = sfrr/n;
w = [0:n-1]'*2*pi*df;
dw1 = w-w1;
dw2 = w-w2;

Hw1 = sig1*exp(-0.5*(dw1/c1).^2)/sqrt(2*pi*c1^2);
Hw2 = sig2*exp(-0.5*(dw2/c2).^2)/sqrt(2*pi*c2^2);
Hw = Hw1 + Hw2;
Hw0 = [Hw(1:n/2); Hw(n/2:-1:1)];
Sw = (sfrr/2)*sqrt(Hw0);

ph0 = 2*pi*rand(n/2-1,1);
ph = [ 0; ph0; 0; -flipud(ph0) ]; 
SwC = Sw .* exp(j*ph);
x = (1/n)*real(ifft(SwC));

xstd = std(x);
ratio = rrstd/xstd;
rr = rrmean + x*ratio;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ind = detectpeaks(X, thetap, sfecg)
N = length(X);
irpeaks = zeros(N,1);

theta = atan2(X(:,2),X(:,1));
ind0 = zeros(N,1);
for i=1:N-1
   a = ( (theta(i) <= thetap) & (thetap <= theta(i+1)) );
   j = find(a==1);
   if ~isempty(j)
      d1 = thetap(j) - theta(i);
      d2 = theta(i+1) - thetap(j);
      if d1 < d2
         ind0(i) = j;
      else 
         ind0(i+1) = j;
      end  
   end
end

d = ceil(sfecg/64);
d = max([2 d])
ind = zeros(N,1);
z = X(:,3);
zmin = min(z);
zmax = max(z);
zext = [zmin zmax zmin zmax zmin];
sext = [1 -1 1 -1 1];
for i=1:5
   clear ind1 Z k vmax imax iext;
   ind1 = find(ind0==i);
   n = length(ind1);
   Z = ones(n,2*d+1)*zext(i)*sext(i);
   for j=-d:d
      k = find( (1 <= ind1+j) & (ind1+j <= N) );
      Z(k,d+j+1) = z(ind1(k)+j)*sext(i);
   end
   [vmax, ivmax] = max(Z,[],2);
   iext = ind1 + ivmax-d-1;
   ind(iext) = i;
end



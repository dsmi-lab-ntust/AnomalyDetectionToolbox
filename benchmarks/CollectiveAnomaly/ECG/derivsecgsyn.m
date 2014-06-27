function dxdt = derivsecgsyn(t,x,flag,rr,sfint,ti,ai,bi)
% dxdt = derivsecgsyn(t,x,flag,rr,sampfreq,ti,ai,bi)
% ODE file for generating the synthetic ECG
% This file provides dxdt = F(t,x) taking input paramters: 
% rr: rr process 
% sfint: Internal sampling frequency [Hertz]
% Order of extrema: [P Q R S T]
% ti = angles of extrema [radians] 
% ai = z-position of extrema 
% bi = Gaussian width of peaks 
% Copyright (c) 2003 by Patrick McSharry & Gari Clifford, All Rights Reserved  
% See IEEE Transactions On Biomedical Engineering, 50(3), 289-294, March 2003.
% Contact P. McSharry (patrick AT mcsharry DOT net) or 
% G.D. Clifford (gari AT mit DOT edu)

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


xi = cos(ti);
yi = sin(ti);
ta = atan2(x(2),x(1));
r0 = 1;
a0 = 1.0 - sqrt(x(1)^2 + x(2)^2)/r0;
ip = 1+floor(t*sfint); 
w0 = 2*pi/rr(ip);


fresp = 0.25;
zbase = 0.005*sin(2*pi*fresp*t);

dx1dt = a0*x(1) - w0*x(2);
dx2dt = a0*x(2) + w0*x(1);

dti = rem(ta - ti, 2*pi);
dx3dt = - sum(ai.*dti.*exp(-0.5*(dti./bi).^2)) - 1.0*(x(3) - zbase);

dxdt = [dx1dt; dx2dt; dx3dt];

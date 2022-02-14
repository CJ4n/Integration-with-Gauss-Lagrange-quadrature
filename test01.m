% Author: Jan Cichomksi 313201
%
% Script tests whether MainIntegrateGL computes exact solutions for
% polynomials of utmost 2n-1 degree if we use n-point Gauss-Legendre
% quadrature, relative error should be very close to 0 if polynomial
% is of utmost 2n-1 degree regardless of number of subintervals.
% For first 3 functions ratio of relative errors should be close to 1,
% and for next 3 functions ratio of error should be very big.

% Function to test
f1=@(x,y)x.^3+x.^2+x.^1+1;
f2=@(x,y)y.^5+y.^4+y.^3+y.^2+y.^1+1;
f3=@(x,y)x.^3+x.^2+x.^1+1+y.^5+y.^4+y.^3+y.^2+y.^1+1;
f4=@(x,y)x.^4+x.^3+x.^2+x.^1+1;
f5=@(x,y)y.^6+y.^5+y.^4+y.^3+y.^2+y.^1+1;
f6=@(x,y)x.^4+x.^3+x.^2+x.^1+1+y.^6+y.^5+y.^4+y.^3+y.^2+y.^1+1;

% Variables, they should not by changed at all!!!
n1=1;
m1=1;
n2=30;
m2=40;
a=-2;
b=2;
c=-3;
d=5;

% Exact analytical values
wf1=224/3;
wf2=201536/15;
wf3=67552/5;
wf4=2656/15;
wf5=6229472/105;
wf6=2082688/35;

fprintf("______________TEST01______________\n")
print(f1,wf1,a,b,c,d,n1,m1,n2,m2)
print(f2,wf2,a,b,c,d,n1,m1,n2,m2)
print(f3,wf3,a,b,c,d,n1,m1,n2,m2)
print(f4,wf4,a,b,c,d,n1,m1,n2,m2)
print(f5,wf5,a,b,c,d,n1,m1,n2,m2)
print(f6,wf6,a,b,c,d,n1,m1,n2,m2)

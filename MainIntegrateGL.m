function [r, error]=MainIntegrateGL(f, s1, s2, n1, n2)
% Author: Jan Cichomski 313201
%
% Function computes double integral of function f(x,y) over area
% D=(s1xs2) with composite 2-points Gauss-Legendre quadrature with respect
% to x and composite 3-points Gauss-Legendre quadrature with respect to y.
% The function should have proper integral over s1xs2 area,
% e.g. f(x,y)=1/x+1/y over [-1,1]x[-1,1] is invalid since there is no
% proper integral for this function.
% in:
%      f - function handle to two-variable function f(x,y),
%          which integral you want to compute.
%     s1 - interval for which integral should be computed with respect to x
%          s1 should be a 1x2 vector [a, b], where 'a' is LHS end of
%          interval and 'b' RHS end of interval.
%     s2 - interval for which integral should be computed with respect to y
%          s2 should be a 1x2 vector [c, d], where 'c' is LHS end of
%          interval and 'd' RHS end of interval.
%     n1 - into how many subintervals divide vector [a, b], n1 should be
%          a positive integer.
%     n2 - into how many subintervals divide vector [c, d], n2 should be
%          a positive integer.
% out:
%       r - computed value of integral(f(x,y)dxdy) over s1 x s2 area.
%   error - in case some error occurred and 'r' couldn't be computed
%           'success' will be set to false, otherwise to true.

% Preparing necessary data for computations
[a,b,C,AN,BN,h1,h2]=preparedata(s1,s2,n1,n2);

% Computing double integral
% a,b are matrixes nxm
% AN,BN are 3d vectors (1,1,6)
% Each element of AN,NB is added to matrix a,b (m,n)
% So expresion inside sum() is a 3d vector(m,n,6)
% And r is a vector(1,1,6)
r=sum(f(AN.*h1/2 + (2*a + h1)/2, BN.*h2/2 + (h2 + 2*b)/2), [1 2]);
% Dot product of r and C
r=dot(r,C)*h1*h2/4;

if(isnan(r)||isinf(r))
    error="Result is Nan or Inf, probably invalid interval," + ...
        "e.g. [-1 1]x[-1 1] for function f(x,y)=1/x+1/y";
else
    error="Result is valid";
end


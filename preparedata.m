function [a,b,C,AN,BN,h1,h2]=preparedata(s1,s2,n1,n2)
%
% Function preparedata prepares data that is required to compute
% double integral with Gauss-Legendre quadrature%
% in:
%     s1 - interval for which integral should be computed with respect to x
%          s1 should be a 1x2 vector [a, b], where 'a' is LHS end of
%          interval and 'b' RHS end of interval
%     s2 - interval for which integral should be computed with respect to y
%          s2 should be a 1x2 vector [c, d], where 'c' is LHS end of
%          interval and 'd' RHS end of interval
%     n1 - into how many subintervals divide vector [a, b], n1 should be
%          a positive integer
%     n2 - into how many subintervals divide vector [c, d], n2 should be
%          a positive integer
% out:
%     a - matrix of values, which will be input to function f(x,y)
%     b - matrix of values, which will be input to function f(x,y)
%     C - 1x1x6 vector of coefficients for Gauss-Legendre quadrature
%    AN - 1x1x6 vector with coefficients of Gauss-Legendre quadrature
%    BN - 1x1x6 vector with coefficients of Gauss-Legendre quadrature
%    h1 - lentght of subinterval (s1(2)-s1(1))/n1
%    h2 - lentght of subinterval (s1(2)-s1(1))/n1

% Nodes of Gauss-Legendre quadrature
A=[1;1];
B=[5.555555555555555555555555556e-01, 8.888888888888888888888888889e-01,...
    5.555555555555555555555555556e-01];
% Coefficents of Gauss-Legendre quadrature
AN=[-5.773502691896257645091487805e-01, 5.773502691896257645091487805e-01];
BN= [-7.745966692414833770358530800e-01, 0.0, ...
    7.745966692414833770358530800e-01];

C=(A*B)';
% Reshaping C into 3d vector
C=reshape(C,1,1,numel(C));

h1=(s1(2)-s1(1))/n1;
h2=(s2(2)-s2(1))/n2;
a=s1(1):h1:s1(2)-h1;
b=s2(1):h2:s2(2)-h2;

% Creating matrix [a;a;...;a] with 'lenght(b)' rows
% and matrix [b' b' ... b'] with 'length(a)' columns
[a, b]=meshgrid(a,b);

% Creating vector [AN(1) AN(1) AN(1) AN(2) AN(2) AN(2)]
AN=repelem(AN,1,3);
% Creating vector [BN BN]
BN=repmat(BN,1,2);
% Reshaping AN and BN into 3d vectors
AN=reshape(AN,1,1,numel(AN));
BN=reshape(BN,1,1,numel(BN));

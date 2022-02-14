function print(f,exact,a,b,c,d,n1,m1,n2,m2)
% Author: Jan Cichomski 313201
%
% Help function to print, compute value of integral of function f and
% print relative error (see: printerror) for two numbers of intervals
% e.g. n1=1,m1=1 and n2=30,m2=40, and ratio of those errors.
% in:
%     f - function of which integral will be computed and error calculated.
%     exact - exact analytical solution to integral of f over [a,b]x[c,d].
%     a,b - left and right boundary of interval for 'x' variable.
%     c,d - left and right boundary of interval for 'y' variable.
%     n1,m1/n2,m2 - into how many subintervals divide vector [a,b] and
%     [c,d] respectively.

fprintf("\nRelative error for double integral of:\n")
fprintf("f(x,y) = %s\n",func2str(f))
fprintf('[%.2f x %.2f]x[%.2f x %.2f]\n',a,b,c,d)

out1=MainIntegrateGL(f,[a,b],[c,d],n1,m1);
printerror(out1,exact,n1,m1)

out2=MainIntegrateGL(f,[a,b],[c,d],n2,m2);
printerror(out2,exact,n2,m2)

fprintf("Ratio of errors error1/error2: %.2f\n",abs((out1-exact)/exact)...
    /abs((out2-exact)/exact))

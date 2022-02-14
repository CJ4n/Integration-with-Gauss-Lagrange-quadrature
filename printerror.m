function printerror(out,w,n,m)
% Author: Jan Cichomski 313201
%
% Help function to print relative error and number of intervals.
% (See print.m)
% in:
%     out - value computed with MainIntegrateGL
%     w - exact value of integral
%     n - number of subintervals for 'x' variable
%     m - number of subintervals for 'y' variable

fprintf('n=%d m=%d\n',n,m)
fprintf("RELATIVE ERROR = %e \n", abs((out-w)/w))


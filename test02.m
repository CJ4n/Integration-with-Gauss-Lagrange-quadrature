% Script tests how the relative error changes depending on number of
% subintervals for each variable. Script plots surface showing how the 
% relative error changes as number of subintervals changes. 
% Expected result: the more subintervals the lower relative error.

close all
clearvars

% Test function
f= @(x,y)cos(x)-sin(y.^2)+exp(y*4-4*x)-atan(x)-x.^10+y.^10-...
    atan(y);

% Variables, they should not by changed at all!!!
a=-5;
b=10;
c=-4;
d=10;

% Exact analitical solution
w=log((11494742132376223120464911401*17^(1/2)*101^(1/2))...
    /56027959599931519616) + 60*atan(4) + 70*atan(5) - 290*atan(10)...
    + 14*sin(5) + 14*sin(10) + (exp(4)*(exp(56) - 1))/16 - ...
    (exp(-56)*(exp(56) - 1))/16 + (15*2^(1/2)*pi^(1/2)*...
    (fresnels(-(4*2^(1/2))/pi^(1/2)) - fresnels((10*2^(1/2))/...
    pi^(1/2))))/2 + 9034483710;

x=30;
y=20;
AbsErr=zeros(x,y);
% Collecting data to plot
for i=1:x
    for j=1:y
        AbsErr(i,j)=MainIntegrateGL(f,[a, b],[c, d],j,i);
    end
end
fprintf("______________TEST02______________\n")
surf(1:y,1:x, abs((AbsErr-w)/w));
xlabel("y")
ylabel("x")
zlabel("Relative error")
title("Relative error to number of subintervals for each variable")

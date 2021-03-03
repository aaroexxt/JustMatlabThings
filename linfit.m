xtest = 1:5;
ytest = [2 5 10 11 16];
linfit(xtest, ytest)

ytest = 3*xtest+1;
linfit(xtest, ytest)


function [params] = linfit ( xdata, ydata )
% LINFIT performs linear least squares regression on XDATA and YDATA,
% two equal length vectors containing data for independent and dependent
% variables, respectively. Best-fit values of slope(m) and intercept(b)
% are returned in a single 1x2 vector output argument PARAMS.
%
% Use POLYFIT to fit data to straight line, assigning output to PARAMS.
[m, b] = polyfit(dist, speed, 1)
% Create vector of function values YMODEL = m * XDATA + b
ymodel = (m*xdata)+b;

% Plot XDATA,YDATA as symbols and XDATA,YMODEL as line and on the same graph
% (Plot title and labels are intentionally absent; they will be added later.)
hold on;
plot(xdata, ydata, "o");
plot(xdata, ymodel);
hold off;

% Calculate RSQ, coefficient of determination (r^2 value) for regression.
R = sum((ydata-ymodel).^2)							% Calculate sum-squared residuals R
							% Calculate total sum of squares S
							% Calculate RSQ from R and S
% Create string variable R2TEXT containing r^2 value for display.
r2text = sprintf('Linear fit r^2 = %6.4f', rsq);
% Display text on plot as part of legend.
legend ( 'Measured data' , r2text )
end
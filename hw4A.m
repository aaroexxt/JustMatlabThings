% clear all variables in the workspace
clearvars;
% close all figure windows
close all;
% load data from the file flightdata.txt
v = [10 20 30 40 50 60];
p = [2490 1250 820 620 510 410];

r = 8.314472
t = 300

% LINEARIZED REGRESSION
% use subplot to create 1x2 grid of plots with subplot 2 active
subplot(1, 2, 2);
% define transformed variables X & Y
x = (r*t)./p;
y = v;
% call the linfit function with X,Y; assign output to Params
params = linfit(x, y);
% use fprintf to display best-fit values of m and b
fprintf("Best-fit m=%.3f, b=%.3f\n",params(1),params(2));
% label the graph using the linearized variables ln(V0),ln(xmax)
title("Volume (L) vs RT/P");
xlabel("Volume (L)");
ylabel("RT/P");

% n, moles of gas in sample
n = params(1);
% use fprintf to display value of i0 and tau
fprintf("Experimental values: n=%.3f moles\n",n);
% Create vector V0Model with 100 elements
pModel = linspace(min(p), max(p), 100);
% Create vector iModel from tModel using model equation
vModel = (r*t)./pModel.*n;
% use subplot to make subplot 1 active
subplot(1,2,1);
% plot V0,xmax as symbols and V0Model,xmaxModel as solid curve
hold on;
plot(p, v, "o");
plot(pModel, vModel, "-");
hold off;
% label the graph with a title, axis labels, and units
title("Volume (L) vs Pressure (kpa)");
xlabel("Pressure (kpa)");
ylabel("Volume (L)");
legend("Measured", "Model");


function [params] = linfit ( xdata, ydata )
% LINFIT performs linear least squares regression on XDATA and YDATA,
% two equal length vectors containing data for independent and dependent
% variables, respectively. Best-fit values of slope(m) and intercept(b)
% are returned in a single 1x2 vector output argument PARAMS.
%
% Use POLYFIT to fit data to straight line, assigning output to PARAMS.
params = polyfit(xdata, ydata, 1);
% Create vector of function values YMODEL = m * XDATA + b
ymodel = (params(1).*xdata)+params(2);

% Plot XDATA,YDATA as symbols and XDATA,YMODEL as line and on the same graph
% (Plot title and labels are intentionally absent; they will be added later.)
hold on;
plot(xdata, ydata, "o");
plot(xdata, ymodel);
hold off;

% Calculate RSQ, coefficient of determination (r^2 value) for regression.
R = sum((ydata-ymodel).^2);							% Calculate sum-squared residuals R
S = sum((ymodel-mean(ymodel)).^2);							% Calculate total sum of squares S
rsq = 1-(R/S);  % Calculate RSQ from R and S
% Create string variable R2TEXT containing r^2 value for display.
r2text = sprintf('Linear fit r^2 = %6.4f', rsq);
% Display text on plot as part of legend.
legend ('Measured data', r2text );
end
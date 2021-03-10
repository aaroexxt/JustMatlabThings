% clear all variables in the workspace
clearvars;
% close all figure windows
close all;
% load data from the file flightdata.txt
load RLdata.txt
% extract data into vector variables V0 and xmax
t = RLdata(:, 1); % seconds
i = RLdata(:, 2); % amps

% LINEARIZED REGRESSION
% use subplot to create 1x2 grid of plots with subplot 2 active
subplot(1, 2, 2);
% define transformed variables X & Y
x = t;
y = log(i);
% call the linfit function with X,Y; assign output to Params
params = linfit(x, y);
% use fprintf to display best-fit values of m and b
fprintf("Best-fit m(-1/tau)=%.3f, b(ln(i0))=%.3f\n",params(1),params(2));
% label the graph using the linearized variables ln(V0),ln(xmax)
title("t (sec) vs ln(i) in ln(amps)");
xlabel("t (sec)");
ylabel("ln(i) in ln(amps)");
% TRANSFORMATION TO NONLINEAR MODEL
% calculate i0 initial current from b
i0 = exp(params(2));
% calculate tau, circuit constant from m
tau = -1/params(1);
% use fprintf to display value of i0 and tau
fprintf("Experimental values: i0(amps)=%.3f, tau=%.3f\n",i0, tau);
% Create vector V0Model with 100 elements
tModel = linspace(min(t), max(t), 100);
% Create vector iModel from tModel using model equation
iModel = exp((tModel.*(-1/tau))+log(i0));
% use subplot to make subplot 1 active
subplot(1,2,1);
% plot V0,xmax as symbols and V0Model,xmaxModel as solid curve
hold on;
plot(t, i, "o");
plot(tModel, iModel, "-");
hold off;
% label the graph with a title, axis labels, and units
title("t (sec) vs i (amps)");
xlabel("t (sec)");
ylabel("i (amps)");
legend("Measured", "Model");

%{
% REGRESSION ANALYSIS
% perform 2nd order polyfit on V0,xmax data; assign output to Coeffs
coeffs = polyfit(v0, xmax, 2);
% use fprintf to display best-fit values of a2, a1, a0
fprintf("Best fit values: a2=%.3f, a1=%.3f, a0=%.3f\n",coeffs(3),coeffs(2),coeffs(1));
% Generate v0Model
v0Model = linspace(min(v0), max(v0), 100);
% use polyval with Coeffs and V0 to create xmaxModel vector
xmaxModel = polyval(coeffs, v0Model);
% hold previous plot to prevent overwriting it
hold on;
% add V0,xmaxModel values to plot as a solid curve
plot(v0Model, xmaxModel);
% turn plot hold off
hold off;
% calculate experimental value of g from a2 (see mapping above)
theta = 30; % degrees
g = (2*sind(theta)*cosd(theta))/coeffs(1);
% use fprintf to display value of g
fprintf("Experimental g in m/s^2: %.3f\n",g);
%}



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
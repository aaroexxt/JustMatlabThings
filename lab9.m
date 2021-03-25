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

% Lab9 Part 2
% Method 1
trap_est = my_trap(tModel, iModel);
fprintf("Total charge estimated from measured data by trapezoidal rule is %.1f Coulombs.\n", trap_est);
% Method 2
RLmodel = @(t) i0*exp(-t/tau);
intg_est = integral(RLmodel, min(tModel), max(tModel));
fprintf("Total charge estimated from model by integral function is %.1f Coulombs.\n", intg_est);
% Method 3
exac_est = i0*tau;
fprintf("Total charge from exact integral is %.1f Coulombs.\n", exac_est);

% Lab9 Part 3
L = input("Enter a value for inductance: ");

figure(3);
hold on;
% Calculate time_avg, for central difference method
time_avg = t(2:end)-(diff(t)/2);

% method a, numerical differentiation on measured data
deriv_diff = diff(i) ./ diff(t);
v_diff = deriv_diff.*L;
plot(time_avg, v_diff);
% method b, numerical differentiation on theoretical data
current = i0.*exp(-t./tau);
deriv_curr = diff(current) ./ diff(t);
v_curr = deriv_curr.*L;
plot(time_avg, v_curr);
% method c, analytical differentiation
deriv_ana = (-i0/tau).*exp(-t./tau);
v_ana = deriv_ana.*L;
plot(t, v_ana);
hold off;
title("Voltage (v) vs. Time (sec)");
xlabel("Time (sec)");
ylabel("Voltage (v)");
legend("Deriv\_numerical\_measured", "Deriv\_numerical\_theoretical", "Deriv\_analytical");

function int_est = my_trap(x, y)
   int_est = trapz(x, y);
end

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
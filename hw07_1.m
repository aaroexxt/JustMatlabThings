x = 0;
y0 = 0;

timeSteps = 0:0.02:1; %time steps from t=0 to t=1
currentEuler = eulersRL(y0, timeSteps);
currentEulerPC = eulersRLPC(y0, timeSteps);

% plot stuff
clf;
hold on;
plot(timeSteps, currentEuler);
plot(timeSteps, currentEulerPC);
title("f(x) vs x");
xlabel("x");
ylabel("f(x)");
legend("Euler Approximation", "Predictor-Corrector");

% compare exact vs euler
fprintf("T(sec)\tEuler(A)\n");
for idx = 1:length(timeSteps)
    fprintf("%.3f\t%.3f\t\t%.3f\n", timeSteps(idx), currentEuler(idx), currentEulerPC(idx));
end

% equation: dy/dx = x^2 + y
function [approx] = eulersRL(y0, timeSteps)
    nSteps = numel(timeSteps); % num of time steps
    h = timeSteps(2)-timeSteps(1); % time step size
    y = zeros(size(timeSteps)); % result vector
    y(1) = y0; % initial value
    for step = 1:nSteps-1 % for every step, perform an iteration
        dydx = step^2+y(step);
        y(step+1) = y(step)+h*dydx;
    end
    approx = y;
end

% euler's approx with predictor-corrector
function [approx] = eulersRLPC(y0, timeSteps)
    nSteps = numel(timeSteps); % num of time steps
    h = timeSteps(2)-timeSteps(1); % time step size
    yPC = zeros(size(timeSteps)); % PC array
 
    yPC(1) = y0;
    for step = 1:nSteps-1 % for every step, perform an iteration
        dydx = step^2+yPC(step);
        
        yEst = yPC(step)+h*dydx; % estimate next iteration
        yPC(step+1) = yPC(step)+h*(step^2+(yPC(step)+yEst)/2); % perform predictor-corrector approx
    end
    approx = yPC;
end
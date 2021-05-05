
i0=0; %amps
r = 20; %ohms
l = 3; %inductance, henrys
vIn = 120; % volts

tau = l/r; % seconds, time constant

timeSteps = 0:0.02:1; %time steps from t=0 to t=1
currentEuler = eulersRL(i0, r, l, vIn, timeSteps);
currentEulerPC = eulersRLPC(i0, r, l, vIn, timeSteps);
currentExact = (vIn/r).*(1-exp(-timeSteps./tau));

% plot stuff
clf;
hold on;
plot(timeSteps, currentEuler);
plot(timeSteps, currentEulerPC);
plot(timeSteps, currentExact);
title("Time (sec) vs Current (amps)");
xlabel("Time (sec)");
ylabel("Current (amps)");
legend("Euler Approximation", "Predictor-Corrector", "Exact");

% compare exact vs euler
fprintf("T(sec)\tEuler(A)\tExact(A)\n");
for idx = 1:length(timeSteps)
    fprintf("%.3f\t%.3f\t\t%.3f\n", timeSteps(idx), currentEuler(idx), currentExact(idx));
end

% equation: dI/dt = (-R/L) * I
function [approx] = eulersRL(i0, r, l, vIn, timeSteps)
    nSteps = numel(timeSteps); % num of time steps
    h = timeSteps(2)-timeSteps(1); % time step size
    y = zeros(size(timeSteps)); % result vector
    y(1) = i0; % initial value
    for step = 1:nSteps-1 % for every step, perform an iteration
        dydx = (-r/l)*y(step)+(vIn/l);
        y(step+1) = y(step)+h*dydx;
    end
    approx = y;
end

% euler's approx with predictor-corrector
function [approx] = eulersRLPC(i0, r, l, vIn, timeSteps)
    nSteps = numel(timeSteps); % num of time steps
    h = timeSteps(2)-timeSteps(1); % time step size
    yPC = zeros(size(timeSteps)); % PC array
 
    yPC(1) = i0;
    for step = 1:nSteps-1 % for every step, perform an iteration
        dydx = (-r/l)*yPC(step)+(vIn/l);
        
        yEst = yPC(step)+h*dydx; % estimate next iteration
        yPC(step+1) = yPC(step)+h*((vIn/l)+(-r/l)*(yPC(step)+yEst)/2); % perform predictor-corrector approx
    end
    approx = yPC;
end
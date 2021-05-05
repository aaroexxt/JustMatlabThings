
i0=0; %amps
r = 20; %ohms
l = 3; %inductance, henrys
vM = 120; % volts

vIn = @(t) vM.*sin(60.*t + (pi/4));

tau = l/r; % seconds, time constant

timeSteps = 0:0.002:1; %time steps from t=0 to t=1
currentEulerPC = eulersRLPC(i0, r, l, vIn, timeSteps);
voltageDrop = currentEulerPC.*r;

% plot stuff
clf;
hold off;
figure(1);
plot(timeSteps, currentEulerPC);
title("Time (sec) vs Current (amps)");
xlabel("Time (sec)");
ylabel("Current (amps)");
legend("Predictor-Corrector");
figure(2);
clf;
hold on;
plot(timeSteps, vIn(timeSteps));
plot(timeSteps, voltageDrop);
title("Time (sec) vs Voltage (volts)");
xlabel("Time (sec)");
ylabel("Voltage (volts)");
legend("vIn", "vR");
%axis ( [ 0.8 1 -150 150 ] );

% euler's approx with predictor-corrector
function [approx] = eulersRLPC(i0, r, l, vIn, timeSteps)
    nSteps = numel(timeSteps); % num of time steps
    h = timeSteps(2)-timeSteps(1); % time step size
    yPC = zeros(size(timeSteps)); % PC array
 
    yPC(1) = i0;
    for step = 1:nSteps-1 % for every step, perform an iteration
        dydx = (-r/l)*yPC(step)+(vIn(timeSteps(step))/l);
        
        yEst = yPC(step)+h*dydx; % estimate next iteration
        yPC(step+1) = yPC(step)+h*((vIn(timeSteps(step))/l)+(-r/l)*(yPC(step)+yEst)/2); % perform predictor-corrector approx
    end
    approx = yPC;
end
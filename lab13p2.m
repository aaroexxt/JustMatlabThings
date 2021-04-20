% setup constants
omega = pi;
tau = 2;
Vm = 1;


% original equation with Vm
% V = @(t) Vm*log(-t/tau)*sin(omega*t);

% equation after divding both sides by 0.5*Vm and subtracting 1
syms t
V = @(t) ((log(-t./tau).*sin(omega.*t))/0.5) - 1
% "plotting" version, which uses 1 as the maximum voltage
pV = @(t) Vm*(log(-t./tau).*sin(omega.*t))
pVTest = @(t) 0.5*Vm

eval = @(t) pV(t)-pVTest(t)

bisection(eval, -100, 0)
fzero(eval, -10)
fplot(pV, [-10, 1])
title("Voltage (V) vs Time (t)");
xlabel("Time (t)");
ylabel("Voltage (V)");

function [xM] = bisection(fh, xL, xR)
    % BISECTION uses bisection method to solve f(x) = 0.% fh is handle to f(x)
    % xL and xR are values of x that bracket solution
    % xM returns final estimate of x
    it = 1;
    itLimit = 2000;
    eps = 0.0000001;
    error = 50;
    xM = 100;
    
    % 3 conditions to continue loop: error below value, iteration limit, and successful converge
    while error > eps && it <= itLimit && fh(xM) ~= 0
        % new midpoint
        xM = (xL+xR)/2;
        % recalculate error
        error = abs((xR-xL)/2);
        % do iteration - check that they have the same sign
        if ((fh(xM) > 0 && fh(xR) > 0) || (fh(xM) < 0 && fh(xR) < 0))
            xR = xM;
        else
            xL = xM;
        end
        % increment iteration
        it = it+1;
        % display
        fprintf("Current estimate x: %.3f, f(x): %.3f\n", xM, fh(xM));
    end
    
    % If iteration limit was reached, print error message
    if it >= itLimit
        disp("Warning: Iteration limit reached");
    end
end
% NEWTON Uses Newton’s method to solve f(x) = 0.

%{ 
PART 1

% fh is handle to f(x), dfh is handle to f’(x).
fh = @(x) x.^2-4
dfh = @(x) 2.*x
% Initial guess is x0.
x0 = 1
%}
%{
PART 2
fh = @(x) (x.^3)-(2.*x)+5
dfh = @(x) (3.*x.^2)-2
x0 = 1+i
fzero(fh, x0)
roots([1 0 -2 5])
%}
%{
PART 3
fh = @(x) 2.*x - tan(x)
dfh = @(x) 1 + (tan(x).^2)
x0 = 1.2
newt(x0, fh, dfh)
%0.2, 1, 0.8
%}
%{
PART 4
xL = 0
xR = 3
fh = @(x) x.^2-4
bisection(fh, xL, xR)
%}

xL = 0
xR = 2
x0 = 1
fh = @(x) log(x)-cos(x)
dfh = @(x) (1/x)+sin(x)
coeffs = [1 0 -2]

bisection(fh, xL, xR)
newt(x0, fh, dfh)
fzero(fh, x0)
roots(coeffs)


fplot(fh, [-10, 10])
title("Plot of function f(x)");
xlabel("X value");
ylabel("Y value");


function [xM] = bisection(fh, xL, xR)
    % BISECTION uses bisection method to solve f(x) = 0.% fh is handle to f(x)
    % xL and xR are values of x that bracket solution
    % xM returns final estimate of x
    it = 1;
    itLimit = 200;
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


% Returns final estimate of x
function [x] = newt(x0, fh, dfh)
    % Initialize variables for:
    % Set iteration counter
    it = 0;
    % Set iteration limit
    itLimit = 20;
    % previous estimate of x (xold)
    xOld = x0;
    % desired error tolerance
    eps = 0.000000001;
    % current value of relative error
    error = 50;
    % As long as error is above tolerance and iteration limit not yet reached, increment counter
    while error > eps && it <= itLimit
        % implement Newton equation
        x = xOld-(fh(xOld)/dfh(xOld));
        % calculate relative error
        error = abs((x-xOld)/xOld);
        % reset xold to current value
        xOld = x;
        % Display current estimates of x and f(x)
        fprintf("Current estimate x: %.3f, f(x): %.3f\n", x, fh(x));
        % increment iteration
        it = it+1;
    end
    
    % If iteration limit was reached, print error message
    if it >= itLimit
        disp("Warning: Iteration limit reached");
    end
end
iters = 15; % Number of iterations
val = 1; % initial approximation

% print header with column titles
fprintf("Iteration\tEstimate\t\tDifference from sqrt(2)\n");

for iter=1:iters % loop from 1 to number of iterations
    % every loop, divide current value by 2 and add 1/the current value (derived from formula given)
    lastVal = val;
    val = lastVal/2;
    val = val + (1/lastVal);
    
    % print iteration #, estimate, and difference from sqrt 2
    fprintf("\t%d\t%.15f\t%.15f\n", iter, val, val-sqrt(2));
end
    
% print final estimation
fprintf("Final estimate: %.15f\nActual value: %.15f\n", val, sqrt(2));


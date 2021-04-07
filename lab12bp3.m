
fprintf("Iteration\tEstimate\t\tDifference from sin(center)\n");
my_sin(20, 5*pi/2)

function approx = my_sin(iters, center)
    val = 0;
    for iter= 0:iters-1
        mult = (-1)^iter; % Multiplier for iteration
        frac = factorial(2*iter + 1); % Bottom of summation fraction
        val = val + (mult/frac)*(center^(2*iter + 1)); % Add everything together
        % print iteration #, estimate, and difference
        fprintf("\t%d\t%.15f\t%.15f\n", iter+1, val, val-sin(center));
    end
    approx = val;
end
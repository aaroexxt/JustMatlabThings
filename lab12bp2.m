approx = my_pi(100)
nums = 1:100;

clf;
figure(1);
plot(nums, approx);
xlabel("Iter #");
ylabel("Approximation");
title("Approximation of pi vs Iteration #");


function [approx] = my_pi(Nterms)
    % define initial variables
    approx = ones([1, Nterms]);
    % loop from 1 to Nterms
    for iter = 2:Nterms
        % declare frac as 1/(1+(nIters-1)*2), since this is the fractional portion of the approximation
        frac = 1/(1+(iter-1)*2);
        % declare mult as alternating between 1 and -1, since this is what we should multiply the fraction by
        if mod(iter,2) == 1
            mult = 1;
        else
            mult = -1;
        end
        % add fraction to current approximation
        approx(iter) = approx(iter-1)+(frac*mult);
    end
    % return val * 4
    approx = approx.*4;
end



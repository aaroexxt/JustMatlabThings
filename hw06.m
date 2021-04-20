%{
PART 1
sumsteps2(7)

function [sum] = sumsteps2(n)
    sum = 0;
    for it = 1:2:n
        sum = sum + it;
    end
end
%}

%{
PART 2
n = randi([2, 5])
sum = 0;
for it = 1:n
    sum = sum + input("Enter a number: ");
end
disp("Sum of numbers: "+sum);
%}

%{
PART 3
randInts = randi([-10, 10], 1, 5)
Less3 = zeros([1, 5])

Min = 10000;
NumPos = 0;
for idx = 1:length(Less3)
    if randInts(idx) > 0
        NumPos = NumPos+1;
    end
    if randInts(idx) < Min
        Min = randInts(idx)
    end
    Less3(idx) = randInts(idx)-3;
end

randInts
Less3
Min
NumPos
%}

%{
PART 4
x = 1
MyAtan(x)

function [approx] = MyAtan(x)
    actual = atan(x);
    approx = 0;
    it = 0;
    while abs(actual-approx) > 0.000000000000001
        % Add term to approximation
        approx = approx + ((((-1)^it)/(2*it + 1)) * x^(2*it + 1));
        % Add to iteration
        it = it+1;
    end
    
    fprintf("Actual value: %.15f\nEstimated value: %.15f\nIterations: %d", actual, approx, it+1);
end
%}

%{
PART 5
n = 1;
actual = 1/exp(1)
est = 0;
while abs(est-actual) > 0.0001
    est = (1-(1/n))^n;
    n = n+1;
end

fprintf("Actual: %.15f\nEstimation: %.15f\nIterations: %d\n", actual, est, n);
%}

n = 6;
it = 1;
nums = [];
while it<=n
    inp = input("("+it+"/"+n+") Enter an integer: ");
    % check integer and numeric
    if (isnumeric(inp) && floor(inp)==inp)
        nums(end+1) = inp;
        it = it+1;
    else
        disp("Error: entered value is not an integer")
    end
end

negnums = [];
posnums = [];
for idx = 1:n
    if (nums(idx) < 0)
        negnums(end+1) = nums(idx);
    else
        posnums(end+1) = nums(idx);
    end
end

nums
posnums
negnums
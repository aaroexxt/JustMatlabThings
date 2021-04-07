
% Setup initial arrays
savings = zeros(1, 18*12); % Savings balance $ each month
years = zeros(1, 18*12); % Years by month
iR = 0.5; % interest rate per month in percent

% Set initial values
savings(1) = 1000;
years(1) = 1/12;

% Part 4 arrays
increase = [10, 8, 10, 16, 15, 4, 6, 7, 8, 10, 8, 12, 14, 15, 8, 7, 6, 5, 7, 8, 9];
yearsLonger = zeros(1, 22);
cost = zeros(1, 22);

% Set part 4 initial values
cost(1) = 5000;
yearsLonger(1) = 1;

% Calculate savings with continuously compounding interest
for m = 2 : 18*12
    savings(m) = (savings(m-1)*(iR/100)) + savings(m-1) + 100;
    years(m) = m/12;
end

% Calculate cost of tuition with rates from array
for m = 2 : 22
    cost(m) = cost(m-1) + (cost(m-1)*(increase(m-1)/100));
    yearsLonger(m) = m;
end

% Output final savings value
fprintf("Final value in savings account: %.3f$ at time t=%.3f years\n", savings(end), years(end))

% Calculate 4 year cost from last 4 values in cost
Total4YCost = 0;
for idx = 19:22
    Total4YCost = Total4YCost + cost(idx);
end

% Output total4ycost
fprintf("Total cost of education over final 4 years: %.3f$\n", Total4YCost)

% Determine whether we have enough to cover the tuition cost
if savings(end) > Total4YCost
    disp("You have enough to cover the cost of the 4 years of education!")
else
    disp("You don't have enough to cover the cost of the 4 years of education :(")
end

% Plot the values
figure(1);
clf;
hold on;
plot(years, savings)
plot(yearsLonger, cost)
legend("Savings", "Tuition Cost")
title("Dollars vs Time (Years)")
xlabel("Time (Years)")
ylabel("Dollars")
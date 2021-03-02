% 1

%{
a = input("Enter the first side: ");
b = input("Enter the second side: ");
y = input("Enter the angle between them in degrees: ");

c = sqrt(a^2 + b^2 -2*a*b*cosd(y));
fprintf("The third side is %.3f\n", c);
%}

%{
p = input("Enter the principal: ");
n = input("Enter the number of years: ");
iR = 0.01:0.01:0.1;

tab = [iR' iR'];
for idx = 1: length(tab(:, 1))
    tab(idx, 2) = FutureBal(p, tab(idx, 1), n);
end

disp(["IRate", "FBal"]);
disp(tab)
    
function bal = FutureBal(principal, interest, years)
    bal = principal*(1+interest)^years;
end

%}

%{
p = input("Enter the principal: ");
iR = input("Enter the interest rate: ");
n = input("Enter the total number of years: ");
yrs = 1:n;

tab = [yrs' yrs'];
for idx = 1: length(tab(:, 1))
    tab(idx, 2) = FutureBal(p, iR, tab(idx, 1));
end

disp(["Years", "FBal"]);
disp(tab)
    
function bal = FutureBal(principal, interest, years)
    bal = principal*(1+interest)^years;
end
%}

%{
load("altTemp.mat")
alt = altTemp(1, :);
temp = altTemp(2, :);

plot(alt, temp);
xlabel("Altitude (ft)")
ylabel("Temperature (K)")
title("Altitude (ft) vs Temperature (K)")

estLinear = interp1(alt, temp, 7000)
estSpline = interp1(alt, temp, 7000, "spline")
%}

%{
f1 = [1 -3 1 5];
f2 = [3 -4 0 -2];
f3 = [3 -2 0 0 4];

x = [2 4 6]

f1Eval = polyval(f1, x)
f2Eval = polyval(f2, x)
f3Eval = polyval(f3, x)
%}

load("distSpeed.mat")
dist = distSpeed(1, :);
speed = distSpeed(2, :);

% Cannot use Linfit for some reason, says it is not found
[p, S] = polyfit(dist, speed, 1);
rSq = 1 - (S.normr/norm(speed - mean(speed)))^2 % Calculate R^2 value
pVal = polyval(p, dist)

hold on;
plot(dist, speed);
plot(dist, pVal);
hold off;
legend("Actual", "Linear Fit");
xlabel("Distance (mi)");
ylabel("Speed (mph)");
title("Distance (mi) vs Speed (mph)");

pr = {"Equation: ", string(poly2sym(p)), sprintf("R^2: %.3f", rSq)}
text(15, 45, pr);
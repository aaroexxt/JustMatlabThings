%{
hours = [40 65 50 30 20 55 45 40];

idxOver = find(hours>40);
hoursOver = hours(idxOver)-40;

disp(sum(hoursOver));

hOver = 0;
for idx = 1:length(hours)
    if hours(idx) > 40
        hOver = hOver + hours(idx)-40;
    end
end
disp(hOver);
%}

%{
w = [0 0 0 1 -4 2 0 4];
removeZeros(w)
removeZeros([3 4 5 0 2 0 6 2 0])

function [res] = removeZeros(arr)
    resPIdx = find(arr~=0);
    res = arr(resPIdx);
end
%}

%{
elong = 0:1:10;
tension = [0 3500 6300 9200 11500 13000 13500 13900 14100 14300 14500];

elModel = interp1(tension, elong, 10000, 'linear');

fprintf("The elongation is %.2f x 10^-3 in\n", elModel)
%}

%{
years = 2006:1:2011;
fUsers = [12 50 100 350 600 800]; % in millions

coeffs = polyfit(years, fUsers, 2);
fUserModel = @(year) coeffs(1)*year^2 + coeffs(2)*year + coeffs(3);

fprintf("Quadratic polynomial:\na=%.3f\nb=%.3f\nc=%.3f\n", coeffs(1), coeffs(2), coeffs(3));
fprintf("Predicted users in 2020: %.5f million\n", fUserModel(2020));
%}

vel = @(t) 5 + 7.*t.^2;
dist = quad(vel, 0, 10);
fprintf("Numerical integration estimate of distance travelled: %.3f\n", dist);
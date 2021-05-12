disp("Fence cost calculator");

area = input("Enclosure area: ");

fun = @(R) FenceCost(area, R, 12, 9);
options = optimset('Display','iter');
[rMin, minCost] = fminbnd(fun, 0, 1000000, options);
lMin = (area-(pi*rMin^2/2))/(2*rMin);

fprintf("MinCost: %.3f\nRadus at min: %.3f\nLength at min: %.3f\n", minCost, rMin, lMin);

function cost = FenceCost(Area, R, CostC, CostS)
    % area = 2*R*L + pi*r^2/2
    L = (Area-(pi.*R.^2./2))./(2.*R);
    
    % Straight fence first
    cost = (2.*L.*CostS) + (2.*R.*CostS);
    % Now add curved fence
    cost = cost + (pi.*R.*CostC);
end
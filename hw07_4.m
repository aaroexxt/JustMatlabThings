%{
disp("Fence Cost as a function of Area and curve radius R");

fprintf("\tR(ft):\t\t10\t\t15\t\t20\t\t25\t\t30\t\t35\t\t40\nArea(ft^2)\n");
for aInt = 2500:100:3500
    fprintf("\t%.f\t", aInt); 
    for rInt = 10:5:40
        fprintf("$%.f\t", FenceCost(aInt, rInt, 12, 9));
    end
    fprintf("\n");
end
%}

clf;
[aInt, rInt] = meshgrid(2500:100:3500, 10:5:40);
cost = FenceCost(aInt, rInt, 12, 9);
mesh(aInt, rInt, cost);
title("Fence Cost ($) vs Area and Curve Radius");
xlabel("Area");
ylabel("Curve Radius");
zlabel("Fence Cost ($)");

function cost = FenceCost(Area, R, CostC, CostS)
    % area = 2*R*L + pi*r^2/2
    L = (Area-(pi.*R.^2./2))./(2.*R);
    
    % Straight fence first
    cost = (2.*L.*CostS) + (2.*R.*CostS);
    % Now add curved fence
    cost = cost + (pi.*R.*CostC);
end
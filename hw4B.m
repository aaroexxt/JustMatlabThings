%{
str = "xyz";

for idx = 1:length(str)
    num = 1+lower(char(str(idx)))-'a';
    num = num-2;
    str(idx) = char(num-1+'a');
end

str
%}

%{
var = zeros([4 2])
var(2, :) = [3 6]
%}

%{
mat1 = randi(11,4,6);
mat1 = mat1-6;
mat1

mat2 = sin(mat1./2);
mat2
%}

%{
myc = clock;
fprintf("Today's date is %.2d/%.2d/%.4d and the current time is %.2d:%.2d:%.2d.\n",myc(2),myc(3),myc(1),myc(4),myc(5),round(myc(6)));
%}

xmin = input("Minimum x value: ");
xmax = input("Maximum x value: ");
xvals = linspace(xmin, xmax, 20);
fun = @(x) x.^3 -4.*x.^2 + sin(x);
yvals = myHWfn(xvals);
mat = [xvals;yvals];

save HWdata.txt mat -ascii
clf;
fplot(fun,[xmin xmax]);
title("f(x) vs x");
xlabel("x");
ylabel("f(x)");
intg = integral(fun,xmin,xmax);
fprintf("Integral of function from [%d to %d]: %.3f\n",xmin,xmax,intg);

function [y] = myHWfn(x)
    y = x.^3 -4.*x.^2 + sin(x);
end
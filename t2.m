h = @(x) sin(x.^2)
xv = linspace(-10, 10, 10000);
yv = h(xv);

filterFn = @(x) (x+10)/20
filtIdx = find(yv > filterFn(xv));
filtX = xv(filtIdx);
filtY = yv(filtIdx);
%
clf; subplot(2, 1, 1);
plot(xv, yv);
title("f(x) vs x"); xlabel("x"); ylabel("f(x)");
subplot(2, 1, 2);
plot(filtX, filtY);
title("f(x) above (x+10)/20 vs x"); xlabel("x"); ylabel("f(x)");
t = [1 10 50 100 150]
fps = [88 90 130 120 110]

% Part a: linear and cubic spline interpolation
linEst = interp1(t,fps,120,'linear');
cubEst = spline(t,fps,120);

fprintf("Estimate of speed (fps) at time t=120s: linear=%.3f, cubic=%.3f\n",linEst,cubEst);

% Part b: fit data with polynomial functions
tInts = linspace(min(t), max(t), 100);
a1 = polyfit(t, fps, 1);
v1 = polyval(a1, tInts);

a2 = polyfit(t, fps, 2);
v2 = polyval(a2, tInts);

a3 = polyfit(t, fps, 3);
v3 = polyval(a3, tInts);

a4 = polyfit(t, fps, 4);
v4 = polyval(a4, tInts);

fprintf("Predicted speeds at t=120s for each model:\nn=1: %.3f\nn=2: %.3f\nn=3: %.3f\nn=4: %.3f\n\n", polyval(a1, 120), polyval(a2, 120), polyval(a3, 120), polyval(a4, 120));

clf;
figure(1);
subplot(2,2,1);
hold on;
plot(t, fps, "ro");
plot(tInts, v1, "b-");
title("Speed (fps) vs Time (sec)");
xlabel("Time (sec)");
ylabel("Speed (fps)");
legend("Measured","Model@n=1");

subplot(2,2,2);
hold on;
plot(t, fps, "ro");
plot(tInts, v2, "b-");
title("Speed (fps) vs Time (sec)");
xlabel("Time (sec)");
ylabel("Speed (fps)");
legend("Measured","Model@n=2");

subplot(2,2,3);
hold on;
plot(t, fps, "ro");
plot(tInts, v3, "b-");
title("Speed (fps) vs Time (sec)");
xlabel("Time (sec)");
ylabel("Speed (fps)");
legend("Measured","Model@n=3");

subplot(2,2,4);
hold on;
plot(t, fps, "ro");
plot(tInts, v4, "b-");
title("Speed (fps) vs Time (sec)");
xlabel("Time (sec)");
ylabel("Speed (fps)");
legend("Measured","Model@n=4");

% Part C: Estimate total distance traveled during the 150 secs
trapEst = trapz(t, fps);
% n=4 is the best, so use that to take the integral
% Create anonymous function
fun = @(x) a4(1).*x.^4 + a4(2).*x.^3 + a4(3).*x.^2 + a4(4).*x + a4(5);
intEst = integral(fun, min(t), max(t));

fprintf("Estimates of displacement from t=0 to t=150:\nTrapezoidal=%.3f\nIntegral=%.3f\n", trapEst, intEst);

% Part D: Calculate acceleration as a function of time

derivCoeffs = polyder(a4);
a = polyval(derivCoeffs, tInts);
figure(2);
clf;
plot(tInts, a, "-");
title("Acceleration (m/s^2) vs Time (sec)");
xlabel("Time (sec)");
ylabel("Acceleration (m/s^2)");

theta = [35 45 60]
v0 = [10 15 20 25 30]
tFlight = [1.2 1.71 2.26 3.15 3.42; 1.49 2.11 2.81 3.72 4.28; 1.85 2.69 3.42 4.45 5.24]

hold on;
plot(v0, tFlight(1, :), "o")
plot(v0, tFlight(2, :), "x")
plot(v0, tFlight(3, :), "s")
hold off;
legend("theta=35deg", "theta=45deg", "theta=60deg");
title("Initial Velocity (m/s) vs Time in Flight (s)");
xlabel("Initial Velocity (m/s)");
ylabel("Time in Flight (s)");

tFLin = interp1(v0, tFlight(1, :), 17);
tFSpl = interp1(v0, tFlight(1, :), 17, "spline");

tFlight = interp2(v0, theta, tFlight, 22, 40)
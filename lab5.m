%{
Projectile motion simulator in Matlab
By Aaron Becker
Lab 5, ENGR 215
Problem: For any given value of Vo and theta, calculate the maximum height yMax, horizontal distance xMax, and time of flight tFlight of a projectile on a ballistic trajectory (no air resistance)
%}

% Define all constants used in program such as g etc %
g = 9.81;

% Prompt for Vo (initial velocity in m/s) from user and store in variable called Vo %
Vo = input('Enter initial velocity of projectile in m/s:');
% Prompt for theta (inital launch angle in deg) from user and store in variable theta %
theta = input('Enter initial launch angle of projectile in degrees:');

% Calculate tFlight, time of projectile flight from launch to "landing" in seconds and store in tFlight %
tFlight = 2*(Vo/g)*sind(theta);
% Calculate yMax, maximum height of projectile in meters and store in yMax%
yMax = (Vo/4)*tFlight*sind(theta);
% Calculate xMax, max horizontal distance of projectile in meters and store in xMax %
xMax = Vo*tFlight*cosd(theta);

% Output results in table to the user, incorporating yMax, xMax, and tFlight %
fprintf('tFlight(s)\tyMax(m)\t\txMax(m)\n');
fprintf('%.3f\t\t%.3f\t\t%.3f\n', tFlight,yMax,xMax);

% Create an array of discrete time intervals, tInt, at which to calculate the projectile position and velocity %
tInt = linspace(0, tFlight, 100);

% Create arrays to hold each value of the projectile at each discrete time interval in t %
xInt = [];
yInt = [];
velInt = [];

% Loop through tInt and calculate x, y, and vel for each point in tInt, store in arrays declared above %
for itm = 1 : length(tInt)
    t = tInt(itm);
    Vx = Vo*cosd(theta); % x vel is constant, but calculate it anyways %
    Vy = Vo*sind(theta)-(g*t); % y vel varies based on time %
    V = sqrt(Vx^2 + Vy^2);
    
    x = Vo*t*cosd(theta);
    y = Vo*t*sind(theta)-(0.5*g*t^2);
    
    % Append to arrays %
    xInt(end+1) = x;
    yInt(end+1) = y;
    velInt(end+1) = V;
end

% Plot array of projectile flight path using xInt and yInt arrays %
figure(1);
plot(xInt, yInt);
title("Projectile Y Position (m) vs X Position (m)");
xlabel("X Position (m)");
ylabel("Y Position (m)");

% Plot array of v values vs t to represent velocity of projectile vs time using velInt and tInt arrays %
figure(2);
plot(tInt, velInt);
title("Projectile Velocity (m/s) vs Time (s)");
xlabel("Time (s)");
ylabel("Velocity (m/s)");

% Print message to end program %
fprintf("Program finished!\n");


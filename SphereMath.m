min = input("Enter minimum radius value: ");
max = input("Enter maximum radius value: ");
height = input("Enter cylinder height: ");

radius = linspace(min, max, 20); % Input radius value from user

SVol = SphereVol(radius); % Calculate sphere volume using function
SArea = SphereArea(radius); % Calculate sphere surface area using function
SVRSphere = SArea./SVol; % Divide calculated surface area by calculated volume to get ratio

SVRCylinder = CylArea(radius, height)./CylVol(radius, height);

hold on
plot(radius, SVRSphere)
plot(radius, SVRCylinder)
hold off
title("Radius (m) vs Surface to Volume Ratio")
xlabel("Radius (m)")
ylabel("Surface to Volume Ratio")
legend("Sphere", "Cylinder")

function SurfaceArea = SphereArea (Radius)
    % Calculates the surface area of a sphere that has a specified radius
    SurfaceArea = (4*pi).*Radius.^2;
end

function Volume = SphereVol ( Radius )
    % Calculates the Volume of a sphere that has a specified value of Radius
    Volume = ((4/3) * pi) .* Radius .^ 3;	
end

function Volume = CylVol(radius, height)
    Volume = (pi*height).*radius.^2
end

function Area = CylArea(radius, height)
    Area = ((2*pi).*radius.^2) + ((2*pi*height).*radius)
end

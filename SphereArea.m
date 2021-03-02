r = input("Input the radius:"); % Input radius value from user
% Calculate sphere volume using function
% Calculate sphere surface area using function
% Divide calculated surface area by calculated volume to get ratio
% Output all values formatted

function SurfaceArea = SphereArea (Radius)
    % Calculates the surface area of a sphere that has a specified radius
    SurfaceArea = 4*pi*Radius^2;
end

function Volume = SphereVol ( Radius )
    % Calculates the Volume of a sphere that has a specified value of Radius
    Volume = (4/3) * pi * Radius ^ 3;	
end

choice = menu("Pick a shape", "Circle", "Rectangle", "Triangle");

switch choice
    case 1
        rad = input("Enter circle's radius: ");
        fprintf("Radius: %.3f\n", pi*rad^2);
    case 2
        base = input("Enter base: ");
        height = input("Enter height: ");
        fprintf("Area: %.3f\n", base*height);
    case 3
        base = input("Enter base: ");
        height = input("Enter height: ");
        fprintf("Area: %.3f\n", base*height/2);
    otherwise
        disp("Invalid choice; pick another option");
end
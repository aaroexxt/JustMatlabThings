% 1
y = 0;
for k = 2 : 2 : 10
     y = 10 * k;
     disp( [k  y] )
end
fprintf("\n\n")

% 2
y = 1;
for k = 1 : 5
   y = y * k;
   disp( [k  y] )
end
fprintf("\n\n")

% 3
y = 15;
for k = 5 : -1 : 1
     y = y - k;
     disp( [k  y] )
end
fprintf("\n\n")

% 4
y = 1;
for k = 1 : 5
    z = y;
    y = y + z;
    disp( [k  z  y] )
end
fprintf("\n\n")

% 5
y = 1;
sign = 1;
for k = 1 : 5
     sign = -sign;
     y = y + sign * 2 * k;
     disp( [k  sign  y] )
end
fprintf("\n\n")

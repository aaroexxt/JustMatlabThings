% Finds roots of a quadratic equation for user inputs of a,b,c
disp('For a quadratic equation of form ax^2 + bx + c = 0')
a = input('Enter value for a: ');      % prompt user for a
b = input('Enter value for b: ');      % prompt user for b
c = input('Enter value for c: ');      % prompt user for c
if a~=0 & (b*b) < (4*a*c)
    x1 = (-b + sqrt(b^2 - 4*a*c) ) / (2*a);     % calc x1
    x2 = (-b - sqrt(b^2 - 4*a*c) ) / (2*a);     % calc x2
    disp('Roots are complex.')                  % complex roots
    disp(x1), disp(x2)                          % display roots
elseif a~=0 & (b*b) >= (4*a*c)
    x1 = (-b + sqrt(b^2 - 4*a*c) ) / (2*a);     % calc x1
    x2 = (-b - sqrt(b^2 - 4*a*c) ) / (2*a);     % calc x2
    disp('Roots are real.')                     % real roots
    disp(x1), disp(x2)                          % display roots
elseif a==0 & b~=0
    disp('One real root.')                      % one real root
    x1 = -c/b;                                  % calc root
    disp(x1)                                    % display root
elseif a==0 & b == 0 & c ~= 0
    disp('No Solution.')                        % no solution
elseif a == 0 & b == 0 & c == 0
    disp('Any x is a solution.')                % inf solutions
end

% A simple version of the quadratic iterator
x = 2-0.000001;                        % starting value of x
c = -2;               % value of constant c
niterations = 70;    % number of iterations for loop
for n = 1 : niterations 
    x = x^2 + c; 				% square x, add c, and reassign to x
    fprintf( '%3.0f  %.15e\n', n, x); 	% print current iteration and x
end 

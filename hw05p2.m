l = input("Enter a character: ", 's');

if strlength(l) > 1
    disp("Please enter a SINGLE character.");
else
    if isletter(l)
        if l >= 'a' & l <= 'z'
            fprintf("%c is a lowercase letter.\n", l);
        else
            fprintf("%c is an uppercase letter.\n", l);
        end
    else
        fprintf("%c is not a letter of the alphabet.\n", l);
    end
end
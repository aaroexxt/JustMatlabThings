Hour=input('Enter the current hour: ');
Hour = floor(Hour);
if Hour>=1 && Hour<=24
   fprintf('The next hour will be %d.\n', nexthour(Hour))
else
   fprintf('Please enter a number from 1 to 24.\n')
end

function next = nexthour(cur)
    if cur >= 12
        next = cur-11;
    else
        next = cur+1;
    end
end
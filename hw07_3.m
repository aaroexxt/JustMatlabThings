

Amat = randi([-20, 20], 3, 5);

ColMax = zeros(1, 5)-99999999;
RowMax = zeros(1, 3)-99999999;
MatMax = -999999999;

for row=1:3
    for col=1:5
        elem = Amat(row, col);
        if (elem > MatMax)
            MatMax = elem;
        end
        if (elem > RowMax(1, row))
            RowMax(1, row) = elem;
        end
        if (elem > ColMax(1, col))
            ColMax(1, col) = elem;
        end
    end
end

disp("Base matrix");
Amat
disp("Column max (nested)");
ColMax
disp("Column max (matlab builtin)");
max(Amat)
disp("Row max (nested)");
RowMax
disp("Row max (matlab builtin)");
max(Amat, [], 2)'
disp("Matrix max (nested)");
MatMax
disp("Matrix max (matlab builtin)");
max(Amat, [], 'all')           
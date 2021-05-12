

exact = pi^2/6;

estimateW = 0;
itW = 1;
while (abs(estimateW-exact) > 10^-5)
    estimateW = estimateW + 1/itW^2;
    itW = itW+1;
end

estimateF = 0;
for itF=1:itW
    estimateF = estimateF + 1/itF^2;
end

itV = 1:itW;
itV = 1./(itV.^2);
estimateV = sum(itV);

fprintf("Exact:\n%.15f\nWhile:\n%.15f\nFor Loop:\n%.15f\nVectorized:\n%.15f\n", exact, estimateW, estimateF, estimateV);
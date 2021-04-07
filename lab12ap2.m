D = 50
i = 0.005
m = 48

fprintf("Loop val: %.3f\nNo loop val: %.3f\n", FutureVal(D, i, m), FutureValNoLoop(D, i, m))


function calcSum = FutureVal(D, i, m)
    calcSum = 0    
    for k = 1 : m
        calcSum = calcSum + D*(1+i)^(k-1)
    end
end

function calcSum = FutureValNoLoop(D, i, m)
    calcSum = (D*(1-(1+i)^m)) / (1-(1+i))
end
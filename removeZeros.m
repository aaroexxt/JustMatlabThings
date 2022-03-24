function [res] = removeZeros(arr)
    resPIdx = find(arr~=0);
    res = arr(resPIdx);
end
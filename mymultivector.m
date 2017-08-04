function Vector= mymultivector(rowIdx,colIdx,entries,vector)
%% a matrix multiply a vector

nrow = size(rowIdx, 2) - 1;
N = size(colIdx, 2); % the number of non-zero element(include diagonal elements)

nvector = size(vector, 1);
if nvector == nrow
    Vector = zeros(nrow,1);
else
    disp('Inner matrix dimensions must agree.');
    return;
end
for i = 1:nrow
    r = rowIdx(i);     %  t is the number of non-zero elements at i-th row    
    if i == nrow
        t = N - rowIdx(i) + 1;
    else
        t = rowIdx(i+1) - rowIdx(i);
    end
    for k = r:r+t-1
        Vector(i,1) = entries(k)*vector(colIdx(k),1) + Vector(i,1);
    end
end
end


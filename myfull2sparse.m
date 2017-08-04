function [rowIdx, colIdx, entries]=myfull2sparse(A)
%% transforming full-matrix to sparse-matrix-by-row

[nrow, ncol] = size(A);
% Initialize 
k = 1;
n = 1;
rowIdx = zeros;
colIdx = zeros;
entries = zeros;

for i = 1:nrow
    entries(k) = A(i,i);
    colIdx(n) = i;
    n = n + 1;
    k = k + 1;
    for j = 1:nrow
        if j == i
            continue;
        end
        if A(i,j) ~= 0
            entries(k) = A(i,j);
            colIdx(n) = j;
            n = n + 1;
            k = k + 1;
        end
    end
    rowIdx(i+1) = n;
end
rowIdx(1) = 1;
rowIdx(nrow+1) = ncol;
end


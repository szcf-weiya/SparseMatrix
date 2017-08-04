function A = mysparse2full(rowIdx, colIdx, entries)
%% transform three-arrays sparse matrix to full matrix

nrow = size(rowIdx, 2) - 1;
ncol = rowIdx(nrow+1);
N = size(colIdx, 2);
A = zeros(nrow, ncol);
for i = 1:nrow
    j = rowIdx(i);
    if i==nrow        
        for k = j:N
            A(i, colIdx(k)) = entries(k);
        end
        break;
    end
    for k = 1:(rowIdx(i+1) - rowIdx(i))
        A(i,colIdx(j)) = entries(j);
        j = j + 1;
    end
end
end


function [ rowIdx1,colIdx1,entries1] = myplus( rowIdx1,colIdx1,entries1,rowIdx2,colIdx2,entries2)
%% one matrix plus one matrix 

nrow1 = size(rowIdx1, 2) - 1;
ncol1 = rowIdx1(nrow1+1);
nrow2 = size(rowIdx2, 2) - 1;
ncol2 = rowIdx2(nrow2+1);

if nrow1 == nrow2 && ncol1 == ncol2
N = size(colIdx2,2);
prow = 1;
for i = 1:N
    if i == rowIdx2(prow+1) && prow < nrow2
        prow = prow + 1;
    end
    [rowIdx1,colIdx1,entries1] = myadd( rowIdx1,colIdx1,entries1,entries2(i),prow,colIdx2(i));
end
else
    disp('matrix dimensions must agree!!!');
end
end


function [ rowIdx,colIdx,entries] = myzero( rowIdx,colIdx,entries,i,j)
%% change the non-zero element to zero
% i: the non-zero element row's index
% j: the non-zero element column's index

% whatever the diagonal element is we return the same matrix 
if i == j
    return;
end

N = size(colIdx,2);
nrow = size(rowIdx,2) - 1;
r = rowIdx(i);
if i ~= nrow                  % t is the number of elements at i-th row
    t = rowIdx(i+1) - rowIdx(i);
else
    t = N - rowIdx(i) + 1;
end
k = find(colIdx(r:(r+t-1)) == j);
if isempty(k)
    return;
end
k = k + r -1;
colIdx(k) = [];
entries(k) = [];
if i ~= nrow
    rowIdx(i+1:nrow) = rowIdx(i+1:nrow) - 1;
end          
end



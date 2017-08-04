function [ rowIdx,colIdx,entries] = myadd( rowIdx,colIdx,entries,a,i,j)
%% add a not zero element at position (i, j)
% a: the element to be inserted
% i: the row index of element a
% j: the col index of element a
% rowIdx: an array
% colIdx: an array
% entries: an array 

r = rowIdx(i); % first index in i row 
N = size(colIdx, 2);% nonzero element numbers
nrow = size(rowIdx,2) - 1;% row numbers
if i ~= nrow    % t the number of the elements at i-th row
    t = rowIdx(i+1) - rowIdx(i); 
else
    t = N - rowIdx(i) + 1;
end
colIdx = [colIdx, 1];
entries = [entries, 1];
if i == nrow                                   
    colIdx(N+1) = j;
    entries(N+1) = a;
else                                       
    colIdx((r+t+1):(N+1)) = colIdx((r+t):N);
    entries((r+t+1):(N+1)) = entries((r+t):N);
    colIdx(r+t) = j;
    entries(r+t) = a;                         
    rowIdx(i+1:nrow) = rowIdx(i+1:nrow) + 1;
end
%% the following is add a number to a non-zero element 
if i ~= nrow                                      
    s = r + t;
else
    s = N + 1;
end
for p = r:s-1
    if colIdx(p) == colIdx(s)
        entries(p) = entries(p) + entries(s);
        colIdx(s) =[];
        entries(s) = [];
        rowIdx(i+1:nrow) = rowIdx(i+1:nrow) - 1;
        break;
    end
end
end


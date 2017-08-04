function [rowIdx,colIdx,entries]=mymatsp2sp(A)
%% transform matlab sparse to three arrays 
% A: full square matrix
% rowIdx : an array
% colIdx : an array
% entries : an array

[I,J,S] = find(A);
N = size(I, 1); % the number of non-zero elements
[nrow ncol] = size(A);

% sort by the first column
tmp = sortrows([I J S],1);
I = tmp(:,1);
J = tmp(:,2);
S = tmp(:,3);

% Initialize 
rowIdx = zeros;
colIdx = zeros;
entries = zeros;
prow = 0;	% a pointer to the row
pcol = 1;	% a pointer to the column
diag = 0;	% record the diag element
k = 1;  

while (k <= N)
    if prow == I(k)
		if I(k) == J(k)     % the diagonal element
			entries(diag) = S(k);
		else
			colIdx(pcol) = J(k);
			entries(pcol) = S(k);
			pcol = pcol + 1;
		end		
        k = k + 1;
    else
		while (prow < I(k))
			prow = prow + 1;
			colIdx(pcol) = prow;
			entries(pcol) = 0;
			diag = pcol;
			rowIdx(prow) = pcol;
			pcol = pcol + 1;
        end
    end
end
while prow < nrow   % fill the rows which all elements are zero
    prow = prow + 1;
    colIdx(pcol) = prow;
	entries(pcol) = 0;
    rowIdx(prow) = pcol;
	pcol = pcol + 1;
end
rowIdx(nrow+1) = ncol;
end



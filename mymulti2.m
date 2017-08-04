function [ RowIdx,ColIdx,Entries] = mymulti2( rowIdx1,colIdx1,entries1,rowIdx2,colIdx2,entries2)
N1 = size(colIdx1, 2);
N2 = size(colIdx2, 2);

nrow1 = size(rowIdx1,2) - 1;
nrow2 = size(rowIdx2,2) - 1;
if nrow1 ~= nrow2
	disp('Inner matrix dimensions must agree.');
    return;
end
RowIdx = zeros;
ColIdx = zeros;
Entries = zeros;
pcol = 1;
for i = 1:nrow1
    RowIdx(i) = pcol;
	r = rowIdx1(i);
	if i == nrow1
		t = N1 - rowIdx1(i) + 1;
	else
		t = rowIdx1(i+1) - rowIdx1(i);
	end
	% find the nonzero column of matrix 2 
	% at the rows which corresponding to 
	% the nonzero column of matrix 1
    nonzerocol2 = [];
	for k = r:r+t-1
        % k is the index of the colIdx1
		% sum{(i,j)*(j,entries1(k))}
		% t2 is the number of element at colIdx(k)-th row in matrix 2
		r2 = rowIdx2(colIdx1(k));% the index of column at the colIdx1(k)-th row in matrix 2
		if colIdx1(k) == nrow2
			t2 = N2 - rowIdx2(colIdx1(k)) + 1; 
		else
			t2 = rowIdx2(colIdx1(k)+1) - rowIdx2(colIdx1(k));
		end
		for k2 = r2:(r2+t2-1)
			nonzerocol2 = union(nonzerocol2, colIdx2(k2));
		end
	end
	% ans(i, nonzerocol2(j)) = sum{(i,:)*(:,nonzerocol2(j))}
    diag = find(nonzerocol2 == i);
    nonzerocol2(diag) = [];
    nonzerocol2 = [i nonzerocol2];
	for j = nonzerocol2
		% k is the index of colIdx1
		tmpsum = 0;
		for k = r:r+t-1	
			% colIdx(k) is the column of element which is nonzero
			% (i,colIdx(k))' = (colIdx(k),i)
            % tmpcol is the index of row in matrix 2
			%tmpcol = find(rowIdx2(1:nrow1) == colIdx1(k));%%pay attention!!!! the last element in rowIdx2 is the number of columns
			%if isempty(tmpcol)	
			% the corresponding position's value is zero
			%	continue;
			%end
			% tmpt is the number of element at tmpcol-th row in matrix 2				
			if colIdx1(k) == nrow2;
                tmpt = N2 + 1 - rowIdx2(colIdx1(k));
            else
                tmpt = rowIdx2(colIdx1(k)+1) - rowIdx2(colIdx1(k));
            end            
			curcol = find(colIdx2(rowIdx2(colIdx1(k)):(rowIdx2(colIdx1(k))+tmpt-1)) == j);
            if isempty(curcol)
			% (colIdx1(k),i)'s value is entries2(curcol)
			% (i,colIdx1(k))'s value is entries1(k)
                tmpsum = tmpsum;                
            else
                curcol = curcol + rowIdx2(colIdx1(k)) - 1;
                tmpsum = tmpsum + entries1(k)*entries2(curcol);
            end
		end
		ColIdx(pcol) = j;
        Entries(pcol) = tmpsum;
        pcol = pcol + 1;
    end
end
RowIdx(nrow1+1) = nrow1;
end
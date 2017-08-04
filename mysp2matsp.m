function A=mysp2matsp(rowIdx,colIdx,entries)
%% transform three-arrays sparse matrix to matlab sparse matrix

nrow = size(rowIdx,2) - 1;
N = size(entries,2);
k = 1;
I = zeros;
J = zeros;
S = zeros;
for i = 1:nrow
    j = rowIdx(i);
    if i == nrow
        for p = j:N
            I(k) = i;
            J(k) = colIdx(p);
            S(k) = entries(p);
            k = k + 1;
        end
        break;
    end
    for p = 1:(rowIdx(i+1)-rowIdx(i))
        I(k) = i;
        J(k) = colIdx(j);
        S(k) = entries(j);
        j = j + 1;
        k = k + 1;
    end
end
for i = N:-1:1
    if S(i)==0
        I(i) = [];
        J(i) = [];
        S(i) = [];
    end
end
A=sparse(I,J,S);
end


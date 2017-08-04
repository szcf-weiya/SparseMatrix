function [ rowIdx1,colIdx1,entries1] = myminus( rowIdx1,colIdx1,entries1,rowIdx2,colIdx2,entries2)
%% one matrix minus another matrix
entries2 = -1 * entries2;
[ rowIdx1,colIdx1,entries1] = myplus( rowIdx1,colIdx1,entries1,rowIdx2,colIdx2,entries2);

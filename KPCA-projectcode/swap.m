%%FUNCTION USED TO SWAP WHILE SORTING (Not relevent for pca)

function x = swap(x,i,j)
% Swap x(i) and x(j)
% Note: In practice, x should be passed by reference

val = x(i);
x(i) = x(j);
x(j) = val;

end
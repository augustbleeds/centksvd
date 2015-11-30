function [nz_num,M] = l0norm(x,thres)
% compute the l0 norm a.k.a count the number of non-zero elements

[m,n] = size(x);

M = [];           % matrix to store the indices of non-zero elements

nz_num = 0;

for i=1:m
    if( abs(x(i)) > thres )
        nz_num = nz_num + 1;
        M(end+1) = i;
    end
end

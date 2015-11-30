clear, clc;
Y = rand(10,7);
Y= 100*Y;
n=41;

[m,k] = size(Y);            % obtain dimensions of Y

[D,X] = cksvd(Y,n,1);


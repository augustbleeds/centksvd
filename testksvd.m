clear, clc

D = createDictionary(10,41);

Y = createSignal(D, 5);



[D,X] = cksvd(Y,D,10,10);

% Centralized is finished
%
%
%

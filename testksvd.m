clear, clc

D = createDictionary(109,41);

Y = createSignal(D, 5);



[D,X] = cksvd(Y,D,19,10);

Y - D*X

% Centralized is finished
%
%
%

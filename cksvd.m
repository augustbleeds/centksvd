function [D,X] = cksvd(Y,n,iter)
%% Centralized KSVD
% Y - signal 
% n - column length of dictionary, n <= k
% Objective: Given a signal/training set Y, 
%            find best the dictionary to represent Y with sparse coding (X)


[m,k] = size(Y);        % obtain dimensions of Y


if(n < k)
   error('For good results, second input argumnet should be greater than or equal to signal column length');
   exit(-1);
end



D = createDictionary(m,n); % create the dictionary



X = mp(Y,D);    % sparse coding stage
X
while( sum(X(:)==0) >= (m*k)/2 )
    
    for i=1:m       % codebook update stage

        [num,Ind] = l0norm(X(i,:)',0);          % # of non-zero elements

        Omega = zeros(k,num);           % matrix to diminish the row vector

        for j=1:length(Ind)             % fill in necessary 1's
            Omega(Ind(j),j) = 1;
        end

        P = zeros(m,k);                 % init matrix to keep running sum

        for j=1:m
            if(i ~= j)
                P = P + D(:,j)*X(j,:);  % add 
            end
        end

        E = Y - P;                      % error (excluding current atom)
        E_R = E*Omega;                  % shrink the error
  
        [U,S,V] = svd(E_R);

        D(:,i) = U(:,1);
        rowl = size(V);
        
        %if(rowl == k)          ONLY ONE THAT MIGHT NEED TO BE PUT BACK
        %    X(i,:) = S(1,1)*(V(:,1)');
        %end

    end

    
    X = mp(Y,D);
    X
end


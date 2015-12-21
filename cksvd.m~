function [D,X] = cksvd(Y,D,iter,sparsity)
%% Centralized KSVD
% Y - signal 
% K - row length of dictionary, K <= n
% Objective: Given a signal/training set Y, 
%            find best the dictionary to represent Y with sparse coding (X)

[m,n] = size(Y);        % obtain dimensions of Y
[m1,K] = size(D);

if(m1 ~= m)
   error('Dictionary and Signal are not in the same dimension');
end


for zz=1:iter
    
    D = normc(D);
    X = full(OMP(D,Y,sparsity));
    
    
    
    
    for k=1:K       % codebook update stage

        [num,Ind] = l0norm(X(k,:)',0);          % # of non-zero elements
        
        if( num ~= 0 ) 
            Omega = zeros(n,num);           % matrix to diminish the row vector

            for j=1:length(Ind)             % fill in necessary 1's
                Omega(Ind(j),j) = 1;
            end
                
           P = zeros(m,n);                 % init matrix to keep running sum

           %for j=1:K
           %    if(k ~= j)        
           %        P = P + D(:,j)*X(j,:);  % add 
           %    end
           %end
            
            P = D*X - D(:,k)*X(k,:);       

            E = Y - P;                      % error (excluding current atom)
            E_R = E*Omega;                  % shrink the error

            [U,S,V] = svd(E_R);

            D(:,k) = U(:,1);

            X(k,Ind) = S(1,1)*(V(:,1)');
        end
       

    end

   
    
end




%% Matching Pursuit 
function X = mp(Y,D,sparsity)
% Inputs:   Y - signal 
%           sparisty (OPTIONAL) - sparsity constraint  
% Output: Construct X s.t Y = DX

if(nargin < 3)
   sparsity = intmax;   % sparsity constrained is relaxed
                        % stopping condition is only governed by residual
end 


[m1,k] = size(Y);
[m2,n] = size(D);

if(m1~=m2)
    error('The dimensions of the signal Y and dictionary D do not match');
end

X = zeros(n,k);         % initialize the sparse coding

for i=1:k               % find sparse coding of EACH column
    R = Y(:,i);         % init residual R to signal column
    
    count = 0;
    while(count < 10 || (l0norm(X,1e-2) > sparsity) )
        
       [~, index] = max(abs(D'*R));  % using inner product, find index which is most correlated
       
       coeff = dot( D(:,index), R);   % find the dot product (without absolute value)
       
       X(index,i) = X(index,i) + coeff;    % place coefficient in proper row of vector
       
       R = R - coeff*D(:,index);         % recompute residual
       
       count = count + 1;
       
    end
    
end

for i=1:n
    for j=1:k
        if(abs(X(i,j)) <= 1e-4)
           X(i,j) = 0; 
        end
    end
end



    
end
function [ Y ] = createSignal( D, n )
%CREATESIGNAL : creates an m x n signal from dictionary atoms

[m,k] = size(D);  % row length

Y = zeros(m,n);

for i=1:n
    Y(:,i) = D*rand(k,1);
end

end

function [L,U]= mylu(A)
    n= size(A,1);
    L= eye(n); 
    t= zeros(n,1); 
    U= A;
    
    for k=1:1:n-1
        rows= k+1:n;
        t(rows)= U(rows,k)/U(k,k);
        U(rows,rows)= U(rows,rows)- t(rows)*U(k,rows);
        U(rows,k)= 0;
        L(rows,k)= t(rows);
    end
end
function [seq]= markov_sequence_generate(X, T, p_0, n)
    seq = ' '*ones(1,n);
    
    k = 0;
    p=rand;
    while p>0 
        p = p - p_0(1,k+1);
        k = k+1;
    end
    seq(1) = X(1,k);
    k_prev = k;
    
    % Monte carlo Method
    for i=2:n
        p = rand;
        k = 0;
        while p>0
            p = p - T(k_prev,k+1);
            k = k+1;
        end
        seq(i) = X(1,k);
        k_prev = k;
    end
    seq = char(seq);
end
function [p]=markov_steady_state(T)
    [xtra, M] = size(T);
    p = (1/M)*ones(1,M);
    while isequal(p,p*T)==0
        p = p*T;
    end
end
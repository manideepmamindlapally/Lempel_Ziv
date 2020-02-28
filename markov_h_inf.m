function [h]=markov_h_inf(T)
    p = markov_steady_state(T);
    A = sum(T.*log(T), 2);
    h = -p*A;
end
function [h]=markov_h_pi(T)
    p = markov_steady_state(T);
    h = -log(p) * p';
end
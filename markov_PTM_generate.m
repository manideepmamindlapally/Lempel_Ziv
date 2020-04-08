function [T]=markov_PTM_generate(M)
    T = rand(M);
    T = T./sum(T,2);
end
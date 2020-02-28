function [T]=markov_generate(M)
    T = rand(N);
    T = T./sum(T,2);
end
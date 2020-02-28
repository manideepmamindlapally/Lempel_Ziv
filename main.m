X = 'abcdefgh';
[xtra, M] = size(X);
% T = markov_generate(M);
% save('TRANSITION_PROB.mat', 'T');

load( 'TRANSITION_PROB.mat', 'T');
p_0 = ones(1, M)*1/M;

n = 20;
seq = markov_sequence_generate(X, T, p_0, n);

markov_h_inf(T);
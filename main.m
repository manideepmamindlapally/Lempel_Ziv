X = 'abcdefgh';
M = size(X,2);
seq_length = 1000000;
DICTIONARY_SIZE = 10000;

%%======================= Generation of the PTM =========================
% T = markov_PTM_generate(M);
% save('TRANSITION_PROB.mat', 'T');
load( 'TRANSITION_PROB.mat', 'T');

%%======================== Generation of the Markov sequence ===========
% p_0 = ones(1, M)*1/M;
% seq = markov_sequence_generate(X, T, p_0, seq_length);
% dlmwrite('data.txt' , seq, 'delimiter', '');
fID = fopen('data.txt','r');
seq = fscanf(fID,'%c');
fclose(fID);

%%======================== Encoding using Lempel Zev ===================
[lempel_code, lempel_code_length] = lempel_ziv_encode(seq, DICTIONARY_SIZE, X);
% dlmwrite('lempel_ziv_coded_seq.txt', char(lempel_code(1,1:lempel_code_length)), 'delimiter', '');

%%======================== Encoding using Huffman =======================
[huff_steady_code, huff_steady_code_length] = huffman_steady_state(seq,X,T);
% dlmwrite('huffman_steady_coded_seq.txt', char(huff_steady_code(1,1:huff_steady_code_length)), 'delimiter', '');

[huff_markov_code, huff_markov_code_length] = huffman_markov(seq,X,T);
% dlmwrite('huffman_markov_coded_seq.txt', char(huff_markov_code(1,1:huff_markov_code_length)), 'delimiter', '');

%%======================== RESULTS =====================================
% Toggle the comments for the results
% % Entropy of steady state probablity distribution
% markov_h_pi(T)
% 
% % Markov entropy of steady state
% markov_h_inf(T)
% 
% % Compression_ratio of Lempel Ziv coding
% lempel_code_length / seq_length
% 
% % Compression ratio of steady state Huffman coding
% huff_steady_code_length / seq_length
% 
% % Compression ratio of markov Huffman coding
% huff_markov_code_length / seq_length
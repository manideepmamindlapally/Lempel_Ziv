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
% [lempel_code, lempel_code_length] = lempel_ziv_encode(seq, DICTIONARY_SIZE, X);
dlmwrite('lempel_ziv_coded_seq.txt', char(lempel_code(1,1:lempel_code_length)), 'delimiter', '');

%%======================== Encoding using Huffman =======================
% [huff_code, huff_code_length] = huffman_markov(seq,X,T);
dlmwrite('huffman_markov_coded_seq.txt', char(huff_code(1,1:huff_code_length)), 'delimiter', '');

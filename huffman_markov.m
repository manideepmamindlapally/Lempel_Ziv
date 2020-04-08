function [code, code_length] = huffman_markov(seq, X, T)
    M = size(X,2);
    seq_length = size(seq,2);
    HUFFMAN_TABLE = strings(M);
    INDICES = 1:M;
    for i=1:M
        HUFFMAN_TABLE(i,:) = huffman(T(i,:),INDICES,M);
    end

    code = ' '*ones(1,5*seq_length);
    k=ceil(log2(M));
    code(1,1:k) = dec2bin((0:M-1) * (seq(1,1)==X'),k);
    code_length=k;
    for ptr=2:seq_length
        new_s = char(HUFFMAN_TABLE(seq(1,ptr-1)==X', seq(1,ptr)==X'));
        code(1,code_length+1:code_length+size(new_s,2)) = new_s;
        code_length = code_length + size(new_s,2);
    end
end
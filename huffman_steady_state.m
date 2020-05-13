function [code, code_length] = huffman_steady_state(seq, X, T)
    M = size(X,2);
    k = ceil(log2(M));
    seq_length = size(seq,2);
    p = markov_steady_state(T);
    
    INDICES = 1:M;
    HUFFMAN_TABLE = huffman(p,INDICES);

    code = ' '*ones(1,5*seq_length);
    code_length=0;
    
    for ptr=1:seq_length
        new_s = char(HUFFMAN_TABLE(1 , seq(1,ptr)==X'));
        code(1,code_length+1:code_length+size(new_s,2)) = new_s;
        code_length = code_length + size(new_s,2);
    end
end
function [code, code_length]=lempel_ziv_encode(SEQUENCE, DICTIONARY_SIZE, X)
    dictionary = SEQUENCE(1:DICTIONARY_SIZE);
    M = size(X,2);
    seq_length = size(SEQUENCE,2);
    k = ceil(log2(M));
    
    code = ' '*ones(1,5*seq_length);
    new_code = reshape([ones(DICTIONARY_SIZE,1)*'1', dec2bin((0:M-1) * (dictionary == X'), k)]', 1, []);
    new_code_length = size(new_code,2);
    code(1:new_code_length) = new_code;
    code_length = new_code_length;

    ptr = DICTIONARY_SIZE;
    pos = 0;
    lengths = zeros(1,DICTIONARY_SIZE);
    while ptr + pos + 1 <= seq_length
        identification = dictionary(1:DICTIONARY_SIZE-pos) == SEQUENCE(ptr+pos+1);
        if max(identification)==0 || ptr+pos+1==seq_length
            if pos==0
                new_code = ['1' dec2bin((0:M-1)*SEQUENCE(ptr+pos+1)==X', k)];
            else
                [n, l] = max(lengths);
                new_code = [ones(1,floor(l)+1)*'0' dec2bin(l) ones(1,floor(n)+1)*'0' dec2bin(n)];
            end
            new_code_length = size(new_code,2);
            code(1,code_length+1:code_length+new_code_length) = new_code;
            code_length = code_length + new_code_length;
            ptr = ptr + pos + 1;
            lengths = zeros(1,DICTIONARY_SIZE);
            pos=0;
        else
            lengths(1,1+pos:DICTIONARY_SIZE) = lengths(1,1+pos:DICTIONARY_SIZE) + identification;
            pos = pos + 1;
        end
    end
end
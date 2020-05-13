function [huff_code] = huffman(prob, indices)
    
    if size(prob,2)==2
        huff_code = strings(1, size(indices,2));
        huff_code(1,indices) = ["0", "1"];
        return;
    end
    
    [e1, idx1] = min(prob);
    prob(:,idx1) = [];
    index1 = indices(1,idx1);
    indices(:,idx1) = [];
    
    [e2, idx2] = min(prob);
    prob(1,idx2) = e1 + e2;
    index2 = indices(1, idx2);
    
    huff_code = huffman(prob, indices);
    huff_code(1,index1) = huff_code(1,index2) + "0";
    huff_code(1,index2) = huff_code(1,index2) + "1";
end
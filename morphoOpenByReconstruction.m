function [OR,k] = morphoOpenByReconstruction(MARKER, MASK)
    k = 2;
    
    B = [1 1 1; 1 1 1; 1 1 1];
    
    OR_prev = imdilate(MARKER, B) & MASK;
    OR = imdilate(OR_prev, B) & MASK;
    
    while sum(sum(OR ~= OR_prev))
        OR_prev = OR;
        OR = imdilate(OR_prev, B) & MASK;
        k = k + 1;
    end
end


function [RD,k] = morphoReconDilate4e(F,G,B)

    k = 2;
    DG_prev = morphoGeoDilate4e(F,G,B,1);
    DG = morphoGeoDilate4e(DG_prev,G,B,1);
    
    while sum(sum(DG ~= DG_prev))
        DG_prev = DG;
        DG = morphoGeoDilate4e(DG_prev,G,B,1);
        k = k + 1;
    end
    
    RD = DG;

end


function [RE,k] = morphoReconErode4e(F,G,B)
    k = 2;
    DG_prev = morphoGeoErode4e(F,G,B,1);
    DG = morphoGeoErode4e(DG_prev,G,B,1);
    
    while sum(sum(DG ~= DG_prev))
        DG_prev = DG;
        DG = morphoGeoErode4e(DG_prev,G,B,1);
        k = k + 1;
    end
    
    RE = DG;
end


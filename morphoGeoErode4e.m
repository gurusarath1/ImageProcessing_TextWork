function DG = morphoGeoErode4e(F,G,B,n)

    DG = F;
    
    for i = 1:n
        DG = imerode(DG,B)|G;
    end
    
end
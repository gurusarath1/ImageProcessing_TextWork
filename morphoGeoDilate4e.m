function DG = morphoGeoDilate4e(F,G,B,n)

    DG = F;
    
    for i = 1:n
        DG = imdilate(DG,B)&G;
    end
    
end


function W = pWienerTF4e(H,K)
    sizeH = size(H);

    W = zeros(sizeH(1), sizeH(2));

    for u = 1:sizeH(1)
        for v = 1:sizeH(2)
            W(u,v) = (1/H(u,v)+1).*(abs(H(u,v)).^2 ) ./ ((abs(H(u,v)).^2)+K);
            if isnan(W(u,v))
                W(u,v) = 1;
            end
        end
    end
end


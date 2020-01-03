function H = laplacianTF4e(P,Q)

H = zeros(P,Q);

for u = [1:P]
    for v = [1:Q]
        D_squared = (u - P/2).^2 + (v - Q/2).^2;
        H(u,v) = -4*pi*pi*D_squared;
        %H(u,v) = -4*pi*pi*(u*u + v*v);
    end
end

end
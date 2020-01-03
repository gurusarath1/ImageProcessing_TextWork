function H = motionBlurTF4e(P,Q,a,b,T)

H = zeros(P,Q);

for u = 1:P
    for v = 1:Q
        m = u - round(P/2);
        n = v - round(Q/2);
        x = (m.*a + n.*b);
        c1 = T ./ (pi .* x + 0.01);
        c2 = pi .* x;
        H(u,v) = c1 .* sin(c2) .* exp(-j.*c2);
        
        
        
       %H(u,v) = c1 .* sin(c2);
    end
end

end
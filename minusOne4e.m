function g = minusOne4e(f)
sizeF = size(f);
g = zeros(sizeF(1),sizeF(2));

    for x = [1:sizeF(1)]
        for y = [1:sizeF(2)]
            g(x,y) = f(x,y) .* (-1).^(x+y);
        end
    end

end
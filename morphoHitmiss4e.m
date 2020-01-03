function H = morphoHitmiss4e(I,B,padval,mode)

S = marphoMatch4e(I,B,padval,mode);

[M,N]= size(S);

for i = 1:M
    for j = 1:N
        if S(i,j) == 0.5
            S(i,j) = 0;
        end
    end
end

H = S;

end
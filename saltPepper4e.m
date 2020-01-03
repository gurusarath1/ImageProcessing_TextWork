function g = saltPepper4e(f,ps,pp)
    f = double(f) ./ double(max(max(f)));
    size_f = size(f);
    NoiseProb = ps + pp;
    g = f;
    randnum = rand(size_f(1),size_f(2));

    for i = 1:size_f(1)
        for j = 1:size_f(2)
            if randnum(i,j) > NoiseProb %Retain image

                g(i,j) = f(i,j);
            else %Add Noise

                rand_val = rand;
                %Scale noise prob to 0 - 1
                pp_scaled = pp / (pp+ps);
                ps_scaled = ps / (pp+ps);

                maxVal = max(pp_scaled, ps_scaled);

                if maxVal == pp_scaled

                    if rand_val < maxVal
                        g(i,j) = 0; %Pepper
                    else
                        g(i,j) = 1; %Salt
                    end

                else
                    if rand_val < maxVal
                        g(i,j) = 1; %Salt
                    else
                        g(i,j) = 0; %Pepper
                    end                
                end
            end
        end
    end
end


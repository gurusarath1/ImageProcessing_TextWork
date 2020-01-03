function H = notchReject4e(type, M, N, param, C)

H = zeros(M,N);
M_2 = M / 2;
N_2 = N / 2;
uk = C(1);
vk = C(2);

if strcmp(type, 'ideal')
    
    D0 = param;
    
    for u = 1:M
        for v = 1:N
            Dk1 = ((u - M_2 - uk).^2 + (v - N_2 - vk).^2).^0.5;
            Dk2 = ((u - M_2 + uk).^2 + (v - N_2 + vk).^2).^0.5;
            if Dk1 <= D0 || Dk2 <= D0
                H(u,v) = 0;
            else
                H(u,v) = 1;
            end
                
        end
    end
    
    
elseif strcmp(type, 'gaussian')

    D0 = param;
    D0_square = D0 .* D0;
    
    for u = 1:M
        for v = 1:N
            Dk1 = ((u - M_2 - uk).^2 + (v - N_2 - vk).^2).^0.5;
            Dk2 = ((u - M_2 + uk).^2 + (v - N_2 + vk).^2).^0.5;
            H(u,v) = 1 - exp( -0.5 .* (Dk1 .* Dk2 ./ D0_square) );
   
        end
    end
    

elseif strcmp(type, 'butterworth')
    
    D0 = param(1);
    n = param(2);
    D0_square = D0 .* D0;
    
    for u = 1:M
        for v = 1:N
            Dk1 = ((u - M_2 - uk).^2 + (v - N_2 - vk).^2).^0.5;
            Dk2 = ((u - M_2 + uk).^2 + (v - N_2 + vk).^2).^0.5;
            H(u,v) = 1 ./ ( 1 + (D0_square / (Dk1 .* Dk2)).^n );
                
        end
    end
    
end


end
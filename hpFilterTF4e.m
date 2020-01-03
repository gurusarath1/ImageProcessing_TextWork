function H = hpFilterTF4e(type,P,Q,param)

    H = zeros(P,Q);

    if strcmp(type,'ideal')
        D0 = param;
        
        for u = [1:P]
            for v = [1:Q]
                D = [(u - P/2).^2 + (v - Q/2).^2].^0.5;
                if D <= D0
                    H(u,v) = 0;
                else
                    H(u,v) = 1;
                end
                
            end
        end
    
    elseif strcmp(type,'gaussian')
        D0 = param;
        for u = [1:P]
            for v = [1:Q]
                D = [(u - P/2).^2 + (v - Q/2).^2].^0.5;
                H(u,v) = 1 - exp(-(D*D) / (2*D0*D0));
                
            end
        end            
            
    elseif strcmp(type,'butterworth')
        D0 = param(1);
        n = param(2);
        for u = [1:P]
            for v = [1:Q]
                D = [(u - P/2).^2 + (v - Q/2).^2].^0.5;
                H(u,v) = ( 1 + (D0 / D)^(2*n) )^-1;
            end
        end           
        
    
    end
    

end
function g = dftFiltering4e(f,H,padmode,scaling)

    % Name: Guru Sarath
    % ECEN 642
    % Assignment 4

    % Default is replicate padding
    if nargin < 3
        padmode = 'replicate';
        scaling = 'yes';
    end

    f = im2double(f);
    %f = f ./ max(max(f));
    f_size = size(f);
    
    P_u = f_size(1)*2;
    P_v = f_size(2)*2;
    
    figure(1);
    imshow(f);

    % Pad the image
    if strcmp(padmode,'replicate')
        f_padded = padarray(f,[P_u P_v],'replicate','post');
    elseif strcmp(padmode,'zeros')
        f_padded = padarray(f,[P_u P_v],0,'post');
    elseif strcmp(padmode,'none')
        f_padded = f;
    else
        f_padded = padarray(f,[P_u P_v],'replicate','post');
    end
    
    %Center the frequency
    f_pad_centered = minusOne4e(f_padded);
    
    F = fft2(f_pad_centered);
    
   % F(1)

    G = F .* H;
    %all(isfinite(G))
    %g = minusOne4e(real(ifft2(G)));
   % G(1)
    g = ifft2(G);
   % g(1)
    g = real(g);
    g = minusOne4e(g);
    %Crop the image to remove padding
    g = g(1:f_size(1),1:f_size(2));

    if strcmp(scaling, 'yes')
        g = g ./ max(max(g));
    end
    
    figure(2);
    imshow(g);

end
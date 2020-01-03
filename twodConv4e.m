function g = twodConv4e(f,w)

    % Name: Guru Sarath
    % ECEN 642
    % Assignment: 3

    size_w = size(w);
    size_f = size(f);
    
    g = double(zeros(size_f(1),size_f(2)));
    
    % Rotate the kernal by 180 degrees
    w_flipped = rot90(rot90(w));

    %Number of pixels to pad along the column and row
    NumberOfPixelsToPad_m = ceil((size_w(1) - 1) / 2); 
    NumberOfPixelsToPad_n = ceil((size_w(2) - 1) / 2);
    
    %Replicate padding
    f_padded = padarray(f,[NumberOfPixelsToPad_m,NumberOfPixelsToPad_n],'replicate');
    f_padded = double(f_padded);
    
    % Perform Convolution by looping through all the pixels in the image
    for i = 1:size_f(1)
        for j = 1:size_f(2)
             g(i,j) = sum(sum( f_padded( i : i+size_w(1) - 1, j : j + size_w(2) -1 ) .* w_flipped));
        end
    end
    
    g = g ./ max(max(g));
     
end
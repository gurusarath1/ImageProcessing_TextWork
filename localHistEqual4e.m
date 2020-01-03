function g = localHistEqual4e(f, m, n)

    %ECEN 642
    %Assignment 2
    %Project 3.4
    %Name: Guru Sarath
    %UIN: 829008551
    
    f = imread(f);
    g = f;
    size_f = size(f);
    center_m = ceil(m / 2); %Center of the mask along x axis
    center_n = ceil(n / 2); %Center of the mask along y axis
    
    %Number of pixels to pad
    NumberOfPixelsToPad_m = m - 2; 
    NumberOfPixelsToPad_n = n - 2;
    
    %Replicate padding
    f_padded = padarray(f,[NumberOfPixelsToPad_m,NumberOfPixelsToPad_n],'replicate');
    size_f_padded = size(f_padded);
    
    %Move the mask through the image
    for i = 1:size_f(1)
        for j = 1:size_f(2)
            %Histogram equalize the small section of the image m x n
            localImg = histEqual4e(f_padded(i:i+m-1,j:j+n-1));
            %Update the center value of the pixel
            g(i,j) = localImg(center_m, center_n);
        end
    end
    imshow(g)
    
end
function g = histEqual4e(f)
    
    %ECEN 642
    %Assignment 2
    %Project 3.3
    %Name: Guru Sarath
    %UIN: 829008551

    P_r = zeros(1,256); % Probability of a pixel intensity array
    size_f = size(f);
    TotalNumberOfPixels = size_f(1) * size_f(2);
    g = zeros(size_f(1), size_f(2)); % Output image
    
    cdf_i = zeros(1,256); %CDF of the image pixels 
    hist_map = zeros(1,256); %Map array for all pixel values r-->s
    
    sumX = 0; 
    for i = 0:255 %Iterate through all pixel values to generate the map
        
        P_r(i+1) = sum(sum(f == i)) / TotalNumberOfPixels; %Probability of intensity r
        sumX = sumX + P_r(i+1); %Cumulative sum
        cdf_i(i+1) = sumX;
        hist_map(i+1) = round(cdf_i(i+1) * (256 - 1));
        
    end
    
    % Use the histogram map to the current image
    for i = 1:TotalNumberOfPixels
        g(i) = hist_map(f(i) + 1) ;
    end
    
end

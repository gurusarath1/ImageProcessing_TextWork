function h = imageHist4e(f, mode)
    
    %ECEN 642
    %Assignment 2
    %Project 2.9
    %Name: Guru Sarath
    %UIN: 829008551

    f = imread(f);
    size_f = size(f);cl
    TotalNumberOfPixels = size_f(1) * size_f(2); 
    histData = zeros(1,257); %Create bins for histogram

    %This loop creates the histogram
    for i = 1:256
        histData(1,i) = sum(sum(f == (i - 1)));
    end


    if mode == 'n'
        %Normalize the image by dividing by total number of pixels
        histData = histData ./ TotalNumberOfPixels;
    elseif mode == 'u'
        % Do nothing
    else
        %Default
        histData = histData ./ TotalNumberOfPixels;
    end

    figure(1)
    bar(histData,'BarWidth', 1);
    title("Histogram");
    xlabel("Pixel intensities")
    ylabel("Frequency")
    h = histData;
end
function [g,map] = intXform4e(f,mode,param)
    
    %ECEN 642
    %Assignment 2
    %Project 3.2
    %Name: Guru Sarath
    %UIN: 829008551

    f = imread(f);
    size_f = size(f);
    numPixels = size_f(1)*size_f(2); %Total number of pixels

    map = zeros(1,256); %Map to return
    g = zeros(size_f(1) , size_f(2));
    
    %Show original image for comparison
    figure(2)
    imshow(f)
    % First create a map 
    if strcmp(mode, "negative")
        
        for i = 0:255
            map(i+1) = (256 - 1 - i) / 255;
        end
        
    elseif strcmp(mode, "log")
        
        for i = 0:255
            map(i+1) = log( 1 + (i / 255) ) ;
        end
        
    elseif strcmp(mode, "gamma")

        for i = 0:255
            map(i+1) = (i/255).^param
        end
        
    elseif strcmp(mode, "external") 
        map = param;
    end
    
    %Apply the created map to the image
    for i = 1:numPixels
        g(i) = map(f(i)+1);
    end
    
    figure(3)
    imshow(g);
end
I = imread("rose1024.tif")
imsize = size(I) %size of image
maskSize = imsize/2 %size of mask
center = imsize/2 %center of the image

% calculate the coordinates of upper left and lower right corners
rUL = center(1) - (maskSize(1)/2) + 1
cUL = center(2) - (maskSize(2)/2) + 1
rLR = center(1) + (maskSize(1)/2) 
cLR = center(2) + (maskSize(2)/2) 

%create mask
mask = mask4e(imsize(1), imsize(2), rUL, cUL, rLR, cLR);

NumberOfOnesThatMaskMustHave = maskSize(1) * maskSize(2)
ActualNumberOfOnesInMask = sum(sum(mask))

%imshow(I .* cast(mask,"uint8"))


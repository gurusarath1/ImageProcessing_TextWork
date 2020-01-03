Img1 = imread("angiography-live-image.tif")
Img2 = imread("angiography-mask-image.tif")
 
ImgMasked = imArithmetic4e(Img2, Img1, "subtract");
imshow(ImgMasked)
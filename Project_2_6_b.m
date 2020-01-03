Img = imread("girl.tif");

s = size(Img);
[x1,y1,v] = cursorValues4e(Img); %get upper left point
[x2,y2,v] = cursorValues4e(Img); %get lower right point

%create mask
mask = mask4e(s(1), s(2), floor(y1), floor(x1), floor(y2), floor(x2));

%apply mask
ImgMasked = imArithmetic4e(Img, mask, "multiply");
imshow(ImgMasked); 
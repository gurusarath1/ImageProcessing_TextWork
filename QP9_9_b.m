img = imread('numbers.tif');
figure(1);
imshow(img);
B = ones(35,1);
MARKER = imerode(img,B);
figure(2);
imshow(MARKER)
[out,k] = morphoOpenByReconstruction(MARKER,img);
figure(3);
imshow(out);

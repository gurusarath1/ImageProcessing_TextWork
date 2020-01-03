img = imread('elliptical-blobs-small.tif');
figure(1);
imshow(img);
B = [1 1 1; 1 1 1; 1 1 1];
MARKER = imerode(img,B);

for i = 1:4
    MARKER = imerode(MARKER,B);
end

figure(2);
imshow(MARKER);

[out,k] = morphoOpenByReconstruction(MARKER,img);
figure(3);
imshow(out);
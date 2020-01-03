img = imread('astronaut-interference.tif');
img = double(img) ./ double(max(max(img)));
img = minusOne4e(img);
IMG = fft2(img);
imtool(abs(IMG),[0 10000]);
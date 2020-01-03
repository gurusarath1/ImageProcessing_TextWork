img = imread('astronaut-interference.tif');
s = size(img);
H = notchReject4e('gaussian',s(1)*3,s(2)*3,25,[24 24]);

g = dftFiltering4e(img, H, 'zero', 'yes');

img = double(img) ./ double(max(max(img)));
img = minusOne4e(img);
IMG = fft2(img);
figure(3);
imshow(abs(IMG),[0 10000]);


figure(1)
imtool(H)
figure(2)
imshow(g)

%
%(476, 388)  7.73E+04 
%(526, 438)  7.73E+04 

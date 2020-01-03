img = imread('boy-blurred.tif');
[P Q] = size(img);
img_padded = padarray(img,[P*2 Q*2],0,'post');
H = motionBlurTF4e(P*3, Q*3, 0.1, -0.1, 1.0);
g = dftFiltering4e(img_padded, H, 'none', 'yes');
W = pWienerTF4e(H, 0.0005);
f = dftFiltering4e(g,W,'none','yes');
imshow(f(1:P,1:Q))
img = imread('testpattern512-binary.tif');
figure(1);
imshow(img);

img_box = zeros(12,12);
img_box(1,:) = 1;
img_box(:,1) = 1;
img_box(end,:) = 1;
img_box(:,end) = 1;

H_M_T_img = morphoHitmiss4e(img, img_box, 0, 'same');
img = ~img;
figure(2);
imshow(H_M_T_img)
B = [1 1 1; 1 1 1; 1 1 1];
DG = morphoGeoDilate4e(H_M_T_img, img, B, 100);
DG = ~DG;
figure(3);
imshow(DG);
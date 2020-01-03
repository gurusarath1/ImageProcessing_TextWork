img_calc = imread('calculator-binary.tif');
img_arrow = imread('calculator-binary-upper-arrow.tif');
H_M_T_img = morphoHitmiss4e(img_calc, img_arrow, 0, 'same');
figure(1);
imshow(H_M_T_img)
B = [1 1 1; 1 1 1; 1 1 1];
DG = morphoGeoDilate4e(H_M_T_img, img_calc, B, 100);
figure(2);
imshow(DG);
Final_img = img_calc - DG;
figure(3);
imshow(Final_img);
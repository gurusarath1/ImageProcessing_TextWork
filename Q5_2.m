img = imread('testpattern512.tif');
[P Q] = size(img);
noise = rand(P,Q) + 0.25;

noise_mild = noise*30;
img_mild = double(img) + noise_mild;
img_mild = img_mild / max(img_mild(:));

noise_intermediate = noise*70;
img_intermediate = double(img) + noise_intermediate;
img_intermediate = img_intermediate / max(img_intermediate(:));

noise_heavy = noise*110;
img_heavy = double(img) + noise_heavy;
img_heavy = img_heavy / max(img_heavy(:));

noise_extraHeavy = noise*450;
img_extraHeavy = double(img) + noise_extraHeavy;
img_extraHeavy = img_extraHeavy / max(img_extraHeavy(:));

figure(1)
imshow(img_mild);

figure(2)
imshow(img_intermediate);

figure(3)
imshow(img_heavy);

figure(4)
imshow(img_extraHeavy);

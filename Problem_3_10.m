    % Name: Guru Sarath
    % ECEN 642
    % Assignment: 3

fileID = fopen('lpkernel1D.txt','r');
[A,count] = fscanf(fileID,["%f,"]);
fclose(fileID);

plot(A);

kernel = A * A';
kernel = abs(kernel - max(max(kernel)));
out = twodConv4e(imread("testpattern1024.tif"),kernel);
imshow(out);

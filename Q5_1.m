img_book = imread('book-cover-gaussian.tif');
strip1 = img_book(1:100,500:688);

imhist(strip1)

strip1 = double(strip1);

max_val = max(max(strip1));
size_img = size(strip1);

TotalNumberOfPixels = double(size_img(1) * size_img(2)); 
Mean = 0.0;
StdDev = 0.0;
for i = [0:max_val]
    numPixels = double(sum(sum(strip1 == i)));
    p = numPixels ./ TotalNumberOfPixels;
    Mean = Mean + (i .* p);
end

for i = [0:max_val]
    numPixels = double(sum(sum(strip1 == i)));
    p = numPixels ./ TotalNumberOfPixels;
    StdDev = StdDev + ( (i - Mean).^2 .* p );
end
StdDev = StdDev.^0.5;
 

Mean
StdDev
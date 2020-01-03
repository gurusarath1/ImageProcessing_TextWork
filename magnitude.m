% Magnitude of gradient

kernel = [-1 -2 -1; 0 0 0; 1 2 1];

img = imread("checkerboard1024-shaded.tif");

x = 400;
y = 450;

z1 = img(x-1,y-1);
z2 = img(x,y-1);
z3 = img(x+1,y-1);
z4 = img(x-1,y);
z5 = img(x,y);
z6 = img(x+1,y);
z7 = img(x-1,y+1);
z8 = img(x,y+1);
z9 = img(x+1,y+1);


mag = sqrt( double (( (z7+2*z8+z9) - (z1+2*z2+z3) ).^2 + ( (z3+2*z6+z9)-(z1+2*z4+z7) ).^ 2 ));








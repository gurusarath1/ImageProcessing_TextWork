A = zeros(12,12);
A(:,5:8) = 1;
A(5:8,:) = 1;

A

B1 = [1;1;1;1];
B2 = [0 1 0; 1 1 1; 0 1 0];
B3 = [1 1 ; 1 1];
B4 = [0 1 1 0; 1 1 1 1; 1 1 1 1; 0 1 1 0];

a_ = imdilate(imerode(A,B4),B2);
a_

b_ = imdilate(imerode(A,B1),B3);
b_

c_ = imdilate(imdilate(A,B1),B3);
c_

d_ = imerode(imdilate(A,B3),B2);
d_
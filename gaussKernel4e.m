function w = gaussKernel4e(m, sig, K)

    % Name: Guru Sarath
    % ECEN 642
    % Assignment: 3

   % If value of K is not supplied
   % Default it to 1
if nargin < 3
    K = 1;
end

w = zeros(m,m);

% Center of the kernel
center = ceil(((m-1)/2) + 1);

% Create the kernel
for i = 1:m
    for j = 1:m
        s = center - i;
        t = center - j;
        w(i,j) = K * exp( -( s*s + t*t ) / ( 2 * sig * sig) );
    end
    
end

N = sum(sum(w));

% Normalize the kernel
w = w ./ N;

end
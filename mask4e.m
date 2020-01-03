function m = mask4e(M, N, rUL, cUL, rLR, cLR)
  % This function creates a mask in MxN image
  % rUL, cUL, rLR, cLR are co-ordinates of diagonal corners (upper left and lower right)
  m = -1; % Value returned if input is invalid

  %check if all input values are in range
  if ~((rUL < 1) | (cUL < 1) | (rLR < 1) | (rLR < 1) | (rUL > M) | (cUL > N) | (rLR > M) | (rLR > N))
    
    if ((rLR - rUL) > -1) | ((cLR - cUL) > -1)
      m = zeros(M,N); %create image
      m(rUL:rLR,cUL:cLR) = ones(rLR - rUL + 1, cLR - cUL + 1); %create mask in image
    end
    
  end
  
  if m == -1
    disp('**** Invalid Input ****');
  end
  
end
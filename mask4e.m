function m = mask4e(M, N, rUL, cUL, rLR, cLR)
  
  m = -1;

  if ~((rUL < 1) | (cUL < 1) | (rLR < 1) | (rLR < 1) | (rUL > M) | (cUL > N) | (rLR > M) | (rLR > N))
    
    if ((rLR - rUL) > -1) | ((cLR - cUL) > -1)
      m = zeros(M,N);
      m(rUL:rLR,cUL:cLR) = ones(rLR - rUL + 1, cLR - cUL + 1);
    end
    
  end
  
  if m == -1
    disp('**** Invalid Input ****');
  end
  
end
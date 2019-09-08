function v = pixVal4e(f, r, c)
% get the value of pixel at location (r,c) from the image f
% Solution to project 2.2(a)

  size_f = size(f);

  if (r > size_f(1)) | (c > size_f(2))
    disp('**** pixVal4e: Out of bound ! *****');
    v = -1;
  else
    v = f(r,c);
  end
  
end
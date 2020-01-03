function g = imArithmetic4e(f1,f2, op)
  
%convert image to floating type
  f1 = im2double(f1);
  f2 = im2double(f2);
  
  %perform operation based on input operation
  if strcmp(op, 'add')
    g = f1 + f2;
  elseif strcmp(op, 'subtract')
    g = f1 - f2;
  elseif strcmp(op, 'multiply')
    g = f1 .* f2;
  elseif strcmp(op, 'divide')
    g = f1 ./ f2;
  else
    disp('**** Invalid Operation ****');
    g = -1;
  end
  
end
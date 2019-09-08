function g = imArithmetic4e(f1,f2, op)
  
  im2single(f1);
  im2single(f2);
  
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
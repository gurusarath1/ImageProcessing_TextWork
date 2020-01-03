function s = scanLine4e(f, l, loc)

f_size = size(f) %get size of image

if strcmp(loc, "row") & (f(1) < l) %check bounds
  s = f(l,:);
elseif strcmp(loc, "col") & (f(2) < l) %check bounds
  s = f(:,l);
else
  disp('**** Invalid input !! ****');
  s = -1;
end  

end
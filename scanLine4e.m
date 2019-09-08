function s = scanLine4e(f, l, loc)

f_size = size(f)

if strcmp(loc, 'row') & (f(1) >= l)
  s = f(l,:);
elseif strcmp(loc, 'col') & (f(2) >= l)
  s = f(:,l);
else
  disp('**** Invalid input !! ****');
  s = -1;
end  

end
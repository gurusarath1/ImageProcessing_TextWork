function [r, c, v] = cursorValues4e(f)
  H = figure(123456);
  imshow(f);
  mouse = 0;
  while mouse != 1
    row = 0; col = 0; mouse = 0;
    [row, col, mouse] = ginput(1);
    
    end
  close(H)
  r  = row;
  c = col;
  v = pixVal4e(f, floor(c), floor(r));
end
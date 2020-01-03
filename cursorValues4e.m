function [r, c, v] = cursorValues4e(f)
  H = figure(123456); %create a new figure 'H'
  imshow(f); %chow the image
  mouse = 0;
  
  %wait until user presses left click
  while mouse ~= 1 %while not left click
    row = 0; col = 0; mouse = 0;
    [row, col, mouse] = ginput(1); %get the data from the click
    
    end
  close(H) %close figure 'H'
  
  %return the values
  r  = row;
  c = col;
  v = pixVal4e(f, floor(c), floor(r));
end
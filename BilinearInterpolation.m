function resizedImage = BilinearInterpolation(I, factor)
  I = imread(I);
  figure(23)
  imshow(I);
  size_original = size(I);
  rows_original = size_original(1);
  cols_original = size_original(2);
  resizedImage = 255;
  if factor < 1
      % Shrinking image
      skipInterval = round(1/factor);
      resizedImage = I(1:skipInterval:rows_original,1:skipInterval:cols_original);
      figure(80)
      imshow(resizedImage);
      
  elseif factor > 1
      % zooming image
      newImageSize = size_original * factor;
      resizedImage = ones(newImageSize(1), newImageSize(2));
      resizedImage = cast(resizedImage, "uint8");
      
      %map the pixels from original image to zoomed image
      for x = [0:rows_original - 1]
          for y = [0:cols_original - 1]
              x_new = floor(x * factor + 1);
              y_new = floor(y * factor + 1);
              resizedImage(x_new,y_new) = I(x+1,y+1);
          end
          
      end
      figure(24);
      imshow(resizedImage);
      
      for x = [0:rows_original - 2]
          for y = [0:cols_original - 1]
              x_1 = floor(x * factor + 1);
              x_2 = floor(x * factor + 1) + floor(factor);
              y_const = floor(y * factor + 1);
              z1 = resizedImage(x_1, y_const);
              z2 = resizedImage(x_2, y_const);
              
              m = (z1 - z2) / (x_1 - x_2);
              
              for x_new_interp = [x_1+1 :1 :x_2-1]
                  z_new = (m * x_new_interp) - (m*x_2) + z2;
                  resizedImage(x_new_interp,y_const) = z_new ;
              end
              
              
          end
      end
     
      
     for y = [0:cols_original - 2]
          for x = [0:rows_original - 1]
              y_1 = floor(y * factor + 1);
              y_2 = floor(y * factor + 1) + floor(factor);
              x_const = floor(x * factor + 1);
              z1 = resizedImage(x_const, y_1);
              z2 = resizedImage(x_const, y_2);
              
              m = (z1 - z2) / (y_1 - y_2);
              
              for y_new_interp = [y_1+1:1:y_2-1]
                  z_new = (m * y_new_interp) - (m*y_2) + z2;
                  resizedImage(x_const,y_new_interp) = z_new ;
              end
              
              
          end
     end
      
      
      figure(25);
      imshow(resizedImage);
  else
      resizedImage = I;
  end
  
  end
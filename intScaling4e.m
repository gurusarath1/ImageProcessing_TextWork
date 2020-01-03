function g = intScaling4e(f,mode,type)

%set defaults of arguments are less
if nargin < 2
    mode = "default";
    type = "float";
elseif nargin < 3
    type = "float";
end


  f = imread(f); %read the image
  g_final = 0; %final output image
  negativeValues = f < 0; %check for negative values

  if any(any(negativeValues)) % if negative values are present
    mode = "full"; % force mode to full
  end

  maxValInImage = max(max(f)); %Get max pixel value in image
  minValInImage = min(min(f)); %Get min pixel value in image
  
  %get the max allowed range of the data tye
  if isa(f, "uint8")
    maxRange_f = 255;
  elseif isa(f,"uint16")
    maxRange_f = 65535;
  elseif isa(f,"uint32")
    maxRange_f = 4294967295;
  elseif isa(f,"uint64")
    maxRange_f = 4294967295;
  end

  if strcmp(mode, "default")
      %Default mode
    g_final = f * (1 / maxValInImage);
  elseif strcmp(mode, "full")
      %Full range mode
    gm = f - minValInImage;
    if strcmp(type, "integer")
      g_final= maxRange_f * (gm / maxValInImage);
    elseif strcmp(type, "float")
      g_final = (cast(gm,"single") / cast(maxValInImage,"single"));
    end

  end
  g = g_final;
  imshow(g);
end
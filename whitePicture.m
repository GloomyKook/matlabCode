clc
clear
x = zeros(1140,912);
  for i=1:1140
    x(i,:) = 255;
  end

%   X = x';
  figure,imshow(x);
  imwrite(x,'G:\grating\white.bmp');
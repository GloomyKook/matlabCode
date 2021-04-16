clc;
clear all;
close all;

objectDir =  ('G:\grating\新建文件夹 (2)\新建文件夹 (3)\');
bmp = ('.bmp');

red = zeros(1,25);
green = zeros(1,25);
blue  = zeros(1,25);

for i1=1:23
    i = 20+i1*10;
    picture= imread([objectDir,num2str(i),bmp]);
    r = picture(:,:,1);
    g = picture(:,:,2);
    b = picture(:,:,3);
    [height,width] = size(b);

    AverageRed = sum(r(:))/(height*width);
    AverageGreen = sum(g(:))/(height*width);
    AverageBlue = sum(b(:))/(height*width);
    
    red(1,i1+2) = AverageRed;
    green(1,i1+2) = AverageGreen;
    blue(1,i1+2) = AverageBlue;
end


  
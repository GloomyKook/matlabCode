clc;
clear;
close all;

%µº»ÎÕº∆¨
dir = ('G:\123.bmp');
I1= 50;
I2=200;
I3=254;

I = getHDRPicture(I1,I2,I3,dir);

figure,imshow(I);
imwrite(I,'G:\grating\hdr\1.bmp');
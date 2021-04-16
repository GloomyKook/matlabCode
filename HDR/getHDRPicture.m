% clc;
% clear;
% close all;

function [picure] =getHDRPicture(I1,I2,I3,dir)

I= imread(dir);
I = im2double(I);

Ir =I(:,:,1);  
Ig =I(:,:,2);
Ib =I(:,:,3);
[m,n] = size(Ir);

figure,imshow(Ir);
figure,imshow(Ig);
figure,imshow(Ib);

I1 = 50;
I2 = 100;
I3 = 254;

mask1 = ones(m,n);
mask2 = ones(m,n);
mask3 = ones(m,n);


for i=1:m
    for j =1:n
        if Ir(i,j)>=I1;
            mask1(i,j) = 0;
        end
        if Ig(i,j)>=I1 && Ig(i,j)<=I2;
            mask2(i,j) = 0;
        end
        if Ib(i,j)>=I2 && Ib(i,j) <=I3
            mask3(i,j) = 0;
        end 
    end
end
rPhoto = Ir.*mask1;
gPhoto = Ig.*mask2;
bPhoto = Ib.*mask3;

picure = rPhoto+gPhoto+bPhoto;
end
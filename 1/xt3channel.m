% clc
% clear
a=imread('E:\新建文件夹 (13)\新建文件夹 (7)\1.bmp');

fr=a(:,:,1);
fg=a(:,:,2);
fb=a(:,:,3);
imshow(fr);
figure,imshow(fg);
figure,imshow(fb);
clc
clear
a=imread('E:\�½��ļ��� (13)\�½��ļ��� (5)\�½��ļ���\1.bmp');
a=im2double(a);
a1=imread('E:\�½��ļ��� (13)\�½��ļ��� (5)\�½��ļ���\2.bmp');
a1=im2double(a1);
% b=imread('E:\�½��ļ��� (13)\�½��ļ��� (5)\�½��ļ���\7.bmp');
% b=im2double(b);

comp=1;
comp1=0.0;%%%%%%%%%%%%%ȥ��Ƶ
yuzhi=10;
K=3;

% fr=a(:,:,1)-a1(:,:,1);
% fg=a(:,:,2)-a1(:,:,2);
% fb=a(:,:,3)-a1(:,:,3);

% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=a(:,:,1)+a1(:,:,1);
bg=a(:,:,2)+a1(:,:,2);
bg=bg./2;
bb=a(:,:,3)+a1(:,:,3);
bb=bb./2;
br(br>1)=1;
bg(bg>1)=1;
bb(bb>1)=1;

figure,imshow(mat2gray(bb));
clc;
clear all;

I=imread('F:\ר���\matlab����\�½��ļ���\4.bmp');
I=I(:,:,2);
I=im2double(I);
 R = 20/255; 
[m,n] = size(I);

 sumx = 0;
 sumy = 0;
 count = 0;

 %R = 40/255; 
for i = 1:1:m
    for j = 1:1:n
            if I(i,j,1)>=R 
                 sumx = sumx + I(i,j)*i;
                 sumy = sumy +I(i,j)*j;
                 count = count + I(i,j);
            end
    end
end
sumx = sumx / count;    %sumx�洢��x������
sumy = sumy / count;    %sumy�洢��y������

sx=round(sumx);sy=round(sumy);
%I=mat2gray(I);
ck=zeros(m,n,3);
ck(:,:,1)=I;
ck(:,:,2)=I;
ck(:,:,3)=I;
ck(sx,sy,1)=1;
ck(sx,sy,2)=0;
ck(sx,sy,3)=0;
figure,imshow(ck);
zshu2=sx;
zheng2=sy;
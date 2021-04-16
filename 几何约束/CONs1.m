clc
clear
I4=im2double(imread('F:\623\20200622_220236_BMP\新建文件夹\4.bmp'));
I3=im2double(imread('F:\623\20200622_220236_BMP\新建文件夹\3.bmp'));
I2=im2double(imread('F:\623\20200622_220236_BMP\新建文件夹\2.bmp'));
I1=im2double(imread('F:\623\20200622_220236_BMP\新建文件夹\1.bmp'));
dt=1;
I1=I1(:,:,dt);
I2=I2(:,:,dt);
I3=I3(:,:,dt);
I4=I4(:,:,dt);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
i3t=zeros(m/2-1,n/2-1);
i4t=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(I1(i*2,j*2)+I1(i*2,j*2+1)+I1(i*2+1,j*2)+I1(i*2+1,j*2+1))/4;
    end
end

for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(I2(i*2,j*2)+I2(i*2,j*2+1)+I2(i*2+1,j*2)+I2(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        i3t(i,j)=(I3(i*2,j*2)+I3(i*2,j*2+1)+I3(i*2+1,j*2)+I3(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        i4t(i,j)=(I4(i*2,j*2)+I4(i*2,j*2+1)+I4(i*2+1,j*2)+I4(i*2+1,j*2+1))/4;
    end
end
I1=i1t;
I2=i2t;
I3=i3t;
I4=i4t;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,imshow(mat2gray(I1));

[m,n]=size(I1);
a1=zeros(m,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for x=1:m
    for y=1:n
        a1(x,y)=atan2(I2(x,y)-I4(x,y),I1(x,y)-I3(x,y));
    end
end
PH1=a1;
figure,imshow(mat2gray(PH1));

m1=zeros(m,n);
for j=1:n
    m1(:,j)=(3.67/800)*(j-600)-1;
end
figure,imshow(mat2gray(m1));

for i=1:m
    for j=1:n
        if a1(i,j)<m1(i,j)
            a1(i,j)=a1(i,j)+2*pi;
        end
    end
end
figure,imshow(mat2gray(a1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a2=zeros(m,n);
for j=1:n
    a2(:,j)=(2.49-1.8)/(375-297)*(j-297)+1.8;
end

 a1=a2;

I4=im2double(imread('F:\623\新建文件夹\3.bmp'));
I3=im2double(imread('F:\623\新建文件夹\2.bmp'));
I2=im2double(imread('F:\623\新建文件夹\1.bmp'));
I1=im2double(imread('F:\623\新建文件夹\4.bmp'));

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
a2=zeros(m,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for x=1:m
    for y=1:n
        a2(x,y)=atan2(I2(x,y)-I4(x,y),I1(x,y)-I3(x,y));
    end
end
PH1=a2;
figure,imshow(mat2gray(PH1));

a18=a1.*18;
T=zeros(m,n);

for i=1:m
    for j=1:n
        T(i,j)=round((a18(i,j)-a2(i,j))/2*pi);
        T(i,j)=round(T(i,j)./10);
    end
end
figure,imshow(mat2gray(T));

pha1=T.*2*pi+a2;

figure,imshow(mat2gray(pha1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dd=20;
figure,plot(a18(dd,:,:));
hold on
plot(a2(dd,:,:));
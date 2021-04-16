clc
clear
%%%%%%%%%%%%%%%单通道3频率，pi相移生成白
a=imread('G:\925\新建文件夹 (11)\1.bmp');
a=im2double(a);
a1=imread('G:\925\新建文件夹 (11)\2.bmp');
a1=im2double(a1);
%b=imread('G:\925\新建文件夹 (11)\7.bmp');
b=a+a1;
b=im2double(b);

dt=1;
b=b(:,:,dt);
b(b>1)=1;
br=b;
comp=1;
comp1=1.0;%%%%%%%%%%%%%去零频
yuzhi=30;
fr=a(:,:,dt)-a1(:,:,dt);
a=a(:,:,dt);
b=b.*comp1;
% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

%br=b(:,:,dt)./comp;

[m,n]=size(fr);

uf2=zeros(m,n);
mask0=ones(m,n);

for i=1:m
    for j=1:n
        uf2(i,j)=(2*a(i,j)-br(i,j))/(br(i,j)+eps);
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end
%%%%%%%%%%%%%%%%%

for i=1:m
    for j=1:n
        if br(i,j)<yuzhi/255
            mask0(i,j)=0;
        end
    end
end

%uf3=uf3+0.1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% uf1=uf1.*mask1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% uf2=uf2.*mask2;
% uf3=uf3.*mask3;


ufff=uf2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(uf2);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);

for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(ufff(i*2,j*2)+ufff(i*2,j*2+1)+ufff(i*2+1,j*2)+ufff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end


I2=i2t;
mask0=maskt;

I2=I2-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 I1=I2;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K=5;
[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH1=wrapped_Phase;

%figure,imshow(mat2gray(uf3));
%figure,imshow(mat2gray(wrapped_Phase));
pp=log(1+abs(I_fft));
figure,plot((abs(I_fft(M,:))));title('中间行频谱图');

figure;
imshow(log(1+abs(I_fft)),[]);title('频谱图');

figure;
imshow(log(1+abs(jipin)),[]);title('基频转移至中心');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH1=PH1.*mask0;

figure,imshow(mat2gray(I2));
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('G:\925\新建文件夹 (11)\3.bmp');
a=im2double(a);
a1=imread('G:\925\新建文件夹 (11)\4.bmp');
a1=im2double(a1);
%b=imread('G:\925\新建文件夹 (11)\7.bmp');
b=a+a1;
b=im2double(b);


b=b(:,:,dt);
b(b>1)=1;
br=b;

fr=a(:,:,dt)-a1(:,:,dt);
a=a(:,:,dt);
b=b.*comp1;
% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

%br=b(:,:,dt)./comp;

[m,n]=size(fr);

uf2=zeros(m,n);
mask0=ones(m,n);

for i=1:m
    for j=1:n
        uf2(i,j)=(2*a(i,j)-br(i,j))/(br(i,j)+eps);
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end
%%%%%%%%%%%%%%%%%

for i=1:m
    for j=1:n
        if br(i,j)<yuzhi/255
            mask0(i,j)=0;
        end
    end
end

%uf3=uf3+0.1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% uf1=uf1.*mask1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% uf2=uf2.*mask2;
% uf3=uf3.*mask3;


ufff=uf2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(uf2);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);

for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(ufff(i*2,j*2)+ufff(i*2,j*2+1)+ufff(i*2+1,j*2)+ufff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end


I2=i2t;
mask0=maskt;

I2=I2-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 I1=I2;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH2=wrapped_Phase;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH2=PH2.*mask0;
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('G:\925\新建文件夹 (11)\5.bmp');
a=im2double(a);
a1=imread('G:\925\新建文件夹 (11)\6.bmp');
a1=im2double(a1);
%b=imread('G:\925\新建文件夹 (11)\7.bmp');
b=a+a1;
b=im2double(b);

dt=3;
b=b(:,:,dt);
b(b>1)=1;
br=b;

fr=a(:,:,dt)-a1(:,:,dt);
a=a(:,:,dt);
b=b.*comp1;
% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

%br=b(:,:,dt)./comp;

[m,n]=size(fr);

uf2=zeros(m,n);
mask0=ones(m,n);

for i=1:m
    for j=1:n
        uf2(i,j)=(2*a(i,j)-br(i,j))/(br(i,j)+eps);
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end
%%%%%%%%%%%%%%%%%

for i=1:m
    for j=1:n
        if br(i,j)<yuzhi/255
            mask0(i,j)=0;
        end
    end
end


ufff=uf2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(uf2);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);

for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(ufff(i*2,j*2)+ufff(i*2,j*2+1)+ufff(i*2+1,j*2)+ufff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end


I2=i2t;
mask0=maskt;

I2=I2-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 I1=I2;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH3=wrapped_Phase;

%figure,imshow(mat2gray(uf3));
%figure,imshow(mat2gray(wrapped_Phase));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH3=PH3.*mask0;


 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 figure,imshow(mat2gray(PH1));
   figure,imshow(mat2gray(PH2));
    figure,imshow(mat2gray(PH3));
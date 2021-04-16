clc
clear
%%%%%%%%%%%%%%%蓝光3频率，pi相移加合成白
a=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\1.bmp');
a=im2double(a);
a1=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\2.bmp');
a1=im2double(a1);
% b=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\7.bmp');
% b=im2double(b);

comp=1;
comp1=0.0;%%%%%%%%%%%%%去零频
yuzhi=10;
K=30;

fr=a(:,:,1)-a1(:,:,1);
fg=a(:,:,2)-a1(:,:,2);
fb=a(:,:,3)-a1(:,:,3);



% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=a(:,:,1)+a1(:,:,1);
bg=a(:,:,2)+a1(:,:,2);
bb=a(:,:,3)+a1(:,:,3);

br(br>1)=1;
bg(bg>1)=1;
bb(bb>1)=1;

br=br./comp;
bg=bg./comp;
bb=bb./comp;
[m,n]=size(bb);
uf1=zeros(m,n);
uf2=zeros(m,n);
uf3=zeros(m,n);

mask1=ones(m,n);
mask2=ones(m,n);
mask3=ones(m,n);
mask0=ones(m,n);

for i=1:m
    for j=1:n
        if bb(i,j)>=1
            mask3(i,j)=0;
        end
        if bg(i,j)>=1
            mask2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        if mask2(i,j)==1&&mask3(i,j)==1
            mask2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        if mask3(i,j)==1||mask2(i,j)==1
            mask1(i,j)=0;
        end
    end
end

%%%%%%%%%%%%%%%%%
uf1=zeros(m,n);
uf1=im2double(uf1);
uf2=zeros(m,n);
uf2=im2double(uf2);
uf3=zeros(m,n);
uf3=im2double(uf3);



for i=1:m
    for j=1:n
        if bg(i,j)<yuzhi/255
            mask0(i,j)=0;
        end
    end
end

%uf3=uf3+0.1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
uf1=a(:,:,1).*mask1;
uf2=a(:,:,2).*mask2;
uf3=a(:,:,3).*mask3;

uff=uf1+uf2+uf3;


I1=uff;

uff2=br.*mask1+bg.*mask2+bb.*mask3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(uff(i*2,j*2)+uff(i*2,j*2+1)+uff(i*2+1,j*2)+uff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(uff2(i*2,j*2)+uff2(i*2,j*2+1)+uff2(i*2+1,j*2)+uff2(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end
I1=i1t;
I2=i2t;

mask0=maskt;
I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1=I1.*mask0;
I2=I2.*mask0;
I2=I2./2;
uff=I1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure,imshow(mat2gray(br));
% figure,imshow(mat2gray(bg));
% figure,imshow(mat2gray(bb));
% 
% figure,imshow(mat2gray(mask1));
% figure,imshow(mat2gray(mask2));
% figure,imshow(mat2gray(mask3));
% figure,imshow(mat2gray(mask0));
% 
% figure,imshow(mat2gray(fr));
% figure,imshow(mat2gray(fg));
% figure,imshow(mat2gray(fb));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure,imshow(mat2gray(uf1));
% figure,imshow(mat2gray(uf2));
% figure,imshow(mat2gray(uf3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,imshow(mat2gray(I1));
figure,imshow(mat2gray(I2));

 %figure,imshow(mat2gray(mask0));
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1t=I1;
I2t=I2;
I_fft=fftshift(fft2(I1t));
I_fft2=fftshift(fft2(I2t));
I_fft0=I_fft-I_fft2;

a=abs(I_fft0);
jipin=zeros(m,n);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
win=zeros(m,n);
for j=N:n
    win(:,j)=1/2-1/2*cos((pi/K)*j-pi/K*N);
end
for j=floor(K*(N/K+1)):n
    win(:,j)=1;
end
jipin=I_fft0.*win;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%

jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH1=wrapped_Phase;

%figure,imshow(mat2gray(uf3));



pp=log(1+abs(I_fft));
% figure,plot((abs(I_fft0(M,:))));title('中间行频谱图');

% figure;
% imshow(log(1+abs(I_fft)),[]);title('频谱图');
% figure;
% imshow(log(1+abs(I_fft2)),[]);title('频谱图');
figure;
imshow(log(1+abs(I_fft0)),[]);title('频谱图');
  set(gca,'units','normalized','position',[0 0 1 1],'xtick',[],'ytick',[])
  
figure;
imshow(log(1+abs(jipin)),[]);title('基频转移至中心');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH1=PH1.*mask0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%蓝光3频率，pi相移加合成白
a=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\3.bmp');
a=im2double(a);
a1=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\4.bmp');
a1=im2double(a1);
% b=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\7.bmp');
% b=im2double(b);





fr=a(:,:,1)-a1(:,:,1);
fg=a(:,:,2)-a1(:,:,2);
fb=a(:,:,3)-a1(:,:,3);



% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=a(:,:,1)+a1(:,:,1);
bg=a(:,:,2)+a1(:,:,2);
bb=a(:,:,3)+a1(:,:,3);
br(br>1)=1;
bg(bg>1)=1;
bb(bb>1)=1;

br=br./comp;
bg=bg./comp;
bb=bb./comp;
[m,n]=size(bb);
uf1=zeros(m,n);
uf2=zeros(m,n);
uf3=zeros(m,n);

mask1=ones(m,n);
mask2=ones(m,n);
mask3=ones(m,n);


for i=1:m
    for j=1:n
        if bb(i,j)>=1
            mask3(i,j)=0;
        end
        if bg(i,j)>=1
            mask2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        if mask2(i,j)==1&&mask3(i,j)==1
            mask2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        if mask3(i,j)==1||mask2(i,j)==1
            mask1(i,j)=0;
        end
    end
end

%%%%%%%%%%%%%%%%%
uf1=zeros(m,n);
uf1=im2double(uf1);
uf2=zeros(m,n);
uf2=im2double(uf2);
uf3=zeros(m,n);
uf3=im2double(uf3);





%uf3=uf3+0.1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
uf1=a(:,:,1).*mask1;
uf2=a(:,:,2).*mask2;
uf3=a(:,:,3).*mask3;

uff=uf1+uf2+uf3;


I1=uff;

uff2=br.*mask1+bg.*mask2+bb.*mask3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(uff(i*2,j*2)+uff(i*2,j*2+1)+uff(i*2+1,j*2)+uff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(uff2(i*2,j*2)+uff2(i*2,j*2+1)+uff2(i*2+1,j*2)+uff2(i*2+1,j*2+1))/4;
    end
end

I1=i1t;
I2=i2t;


I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1=I1.*mask0;
I2=I2./2;
uff=I1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure,imshow(mat2gray(br));
% figure,imshow(mat2gray(bg));
% figure,imshow(mat2gray(bb));
% 
% figure,imshow(mat2gray(mask1));
% figure,imshow(mat2gray(mask2));
% figure,imshow(mat2gray(mask3));
% figure,imshow(mat2gray(mask0));
% 
% figure,imshow(mat2gray(fr));
% figure,imshow(mat2gray(fg));
% figure,imshow(mat2gray(fb));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % figure,imshow(mat2gray(I1));

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1t=I1;
I2t=I2;
I_fft=fftshift(fft2(I1t));
I_fft2=fftshift(fft2(I2t));
I_fft0=I_fft-I_fft2;

a=abs(I_fft0);
jipin=zeros(m,n);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
win=zeros(m,n);
for j=N:n
    win(:,j)=1/2-1/2*cos((pi/K)*j-pi/K*N);
end
for j=floor(K*(N/K+1)):n
    win(:,j)=1;
end
jipin=I_fft0.*win;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%

jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH2=wrapped_Phase;

%figure,imshow(mat2gray(uf3));



pp=log(1+abs(I_fft));


% figure;
% imshow(log(1+abs(jipin)),[]);title('基频转移至中心');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH2=PH2.*mask0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%蓝光3频率，pi相移加合成白
a=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\5.bmp');
a=im2double(a);
a1=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\6.bmp');
a1=im2double(a1);
% b=imread('C:\Users\liu\Desktop\lw2\新建文件夹 (5)\511\cut\新建文件夹 (2)\7.bmp');
% b=im2double(b);




fr=a(:,:,1)-a1(:,:,1);
fg=a(:,:,2)-a1(:,:,2);
fb=a(:,:,3)-a1(:,:,3);



% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=a(:,:,1)+a1(:,:,1);
bg=a(:,:,2)+a1(:,:,2);
bb=a(:,:,3)+a1(:,:,3);
br(br>1)=1;
bg(bg>1)=1;
bb(bb>1)=1;

br=br./comp;
bg=bg./comp;
bb=bb./comp;
[m,n]=size(bb);
uf1=zeros(m,n);
uf2=zeros(m,n);
uf3=zeros(m,n);

mask1=ones(m,n);
mask2=ones(m,n);
mask3=ones(m,n);


for i=1:m
    for j=1:n
        if bb(i,j)>=1
            mask3(i,j)=0;
        end
        if bg(i,j)>=1
            mask2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        if mask2(i,j)==1&&mask3(i,j)==1
            mask2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        if mask3(i,j)==1||mask2(i,j)==1
            mask1(i,j)=0;
        end
    end
end

%%%%%%%%%%%%%%%%%
uf1=zeros(m,n);
uf1=im2double(uf1);
uf2=zeros(m,n);
uf2=im2double(uf2);
uf3=zeros(m,n);
uf3=im2double(uf3);





%uf3=uf3+0.1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
uf1=a(:,:,1).*mask1;
uf2=a(:,:,2).*mask2;
uf3=a(:,:,3).*mask3;

uff=uf1+uf2+uf3;


I1=uff;

uff2=br.*mask1+bg.*mask2+bb.*mask3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(uff(i*2,j*2)+uff(i*2,j*2+1)+uff(i*2+1,j*2)+uff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(uff2(i*2,j*2)+uff2(i*2,j*2+1)+uff2(i*2+1,j*2)+uff2(i*2+1,j*2+1))/4;
    end
end

I1=i1t;
I2=i2t;


I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1=I1.*mask0;
I2=I2./2;
uff=I1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure,imshow(mat2gray(br));
% figure,imshow(mat2gray(bg));
% figure,imshow(mat2gray(bb));
% 
% figure,imshow(mat2gray(mask1));
% figure,imshow(mat2gray(mask2));
% figure,imshow(mat2gray(mask3));
% figure,imshow(mat2gray(mask0));
% 
% figure,imshow(mat2gray(fr));
% figure,imshow(mat2gray(fg));
% figure,imshow(mat2gray(fb));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % figure,imshow(mat2gray(I1));

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1t=I1;
I2t=I2;
I_fft=fftshift(fft2(I1t));
I_fft2=fftshift(fft2(I2t));
I_fft0=I_fft-I_fft2;

a=abs(I_fft0);
jipin=zeros(m,n);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
win=zeros(m,n);
for j=N:n
    win(:,j)=1/2-1/2*cos((pi/K)*j-pi/K*N);
end
for j=floor(K*(N/K+1)):n
    win(:,j)=1;
end
jipin=I_fft0.*win;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%

jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH3=wrapped_Phase;

%figure,imshow(mat2gray(uf3));



pp=log(1+abs(I_fft));


% figure;
% imshow(log(1+abs(jipin)),[]);title('基频转移至中心');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH3=PH3.*mask0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,imshow(mat2gray(PH1));
  set(gca,'units','normalized','position',[0 0 1 1],'xtick',[],'ytick',[])
  
% figure,imshow(mat2gray(PH2));
% figure,imshow(mat2gray(PH3));
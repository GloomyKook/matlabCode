% clc
% clear
%%%%%%%%%%%%%%%蓝光3频率，pi相移加合成白
a=imread('I:\511\xin\511\新建文件夹 (3)\1.bmp');
a=im2double(a);
a1=imread('I:\511\xin\511\新建文件夹 (3)\2.bmp');
a1=im2double(a1);
% b=imread('I:\511\xin\511\新建文件夹 (3)\7.bmp');
% b=im2double(b);

comp=1;
comp1=0.0;%%%%%%%%%%%%%去零频
yuzhi=10;
K=30;
W=10;
J=468;

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
[m,n]=size(fr);
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
        uf1(i,j)=fr(i,j)/(br(i,j)+eps);
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
        end
    end
end
for i=1:m
    for j=1:n
        uf2(i,j)=fg(i,j)/(bg(i,j)+eps);
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end
for i=1:m
    for j=1:n
        uf3(i,j)=fb(i,j)/(bb(i,j)+eps);
        if uf3(i,j)>1||uf3(i,j)<-1
            uf3(i,j)=0;
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
uf1=uf1.*mask1;
uf2=uf2.*mask2;
uf3=uf3.*mask3;

uff=uf1+uf2+uf3;

uff0=uff;
I1=uff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
uff0t=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(uff(i*2,j*2)+uff(i*2,j*2+1)+uff(i*2+1,j*2)+uff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        uff0t(i,j)=(uff0(i*2,j*2)+uff0(i*2,j*2+1)+uff0(i*2+1,j*2)+uff0(i*2+1,j*2+1))/4;
    end
end
I1=i1t;

mask0=maskt;
uff0=uff0t;
I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(I1);
i1t=zeros(m-1,n-1);
mt=zeros(m-1,n-1);
for i=1:m-1
    for j=1:n-1
        i1t(i,j)=I1(i,j);
        mt(i,j)=mask0(i,j);
    end
end
I1=i1t;
mask0=mt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(I1(i*2,j*2)+I1(i*2,j*2+1)+I1(i*2+1,j*2)+I1(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end
I1=i1t;

mask0=maskt;
I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


I1=I1.*mask0;

uff=I1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fcom=a(:,:,1).*mask1+a(:,:,2).*mask2+a(:,:,3).*mask3;
 figure,imshow(mat2gray(fcom));
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
% % figure,imshow(mat2gray(I1));

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
win=zeros(m,n);
for j=N:n
    win(:,j)=1/2-1/2*cos((pi/K)*j-pi/K*N);
end
for j=floor(K*(N/K+1)):n
    win(:,j)=1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:(2*W+1)
    for j=1:(2*W+1)
        Lv1(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (i - (W+1)) / (2*W)));
        Lv2(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (j - (W+1)) / (2*W)));
     end
end
Window=-(Lv1.*Lv2);

% for i=1:2*W+1
%     for j=1:2*W+1
%         win(M-W+i,J-W+j)=Window(i,j)+1;
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

jipin=I_fft.*win;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%jipin(:,N+K:n)=I_fft(:,N+K:n);

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


 figure,imshow(mat2gray(uff0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('I:\511\xin\511\新建文件夹 (3)\3.bmp');
a=im2double(a);
a1=imread('I:\511\xin\511\新建文件夹 (3)\4.bmp');
a1=im2double(a1);
% b=imread('I:\511\xin\511\新建文件夹 (3)\7.bmp');
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
[m,n]=size(fr);
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
        uf1(i,j)=fr(i,j)/(br(i,j)+eps);
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
        end
    end
end
for i=1:m
    for j=1:n
        uf2(i,j)=fg(i,j)/(bg(i,j)+eps);
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end
for i=1:m
    for j=1:n
        uf3(i,j)=fb(i,j)/(bb(i,j)+eps);
        if uf3(i,j)>1||uf3(i,j)<-1
            uf3(i,j)=0;
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
uf1=uf1.*mask1;
uf2=uf2.*mask2;
uf3=uf3.*mask3;

uff=uf1+uf2+uf3;
I1=uff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(uff(i*2,j*2)+uff(i*2,j*2+1)+uff(i*2+1,j*2)+uff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end
I1=i1t;

mask0=maskt;
I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(I1);
i1t=zeros(m-1,n-1);
mt=zeros(m-1,n-1);
for i=1:m-1
    for j=1:n-1
        i1t(i,j)=I1(i,j);
        mt(i,j)=mask0(i,j);
    end
end
I1=i1t;
mask0=mt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(I1(i*2,j*2)+I1(i*2,j*2+1)+I1(i*2+1,j*2)+I1(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end
I1=i1t;

mask0=maskt;
I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1=I1.*mask0;

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
% % figure,imshow(mat2gray(I1));

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
win=zeros(m,n);
for j=N:n
    win(:,j)=1/2-1/2*cos((pi/K)*j-pi/K*N);
end
for j=floor(K*(N/K+1)):n
    win(:,j)=1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:(2*W+1)
    for j=1:(2*W+1)
        Lv1(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (i - (W+1)) / (2*W)));
        Lv2(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (j - (W+1)) / (2*W)));
     end
end
Window=-(Lv1.*Lv2);

% for i=1:2*W+1
%     for j=1:2*W+1
%         win(M-W+i,J-W+j)=Window(i,j)+1;
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

jipin=I_fft.*win;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%jipin(:,N+K:n)=I_fft(:,N+K:n);

jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH2=wrapped_Phase;

%figure,imshow(mat2gray(uf3));
%figure,imshow(mat2gray(wrapped_Phase));
% pp=log(1+abs(I_fft));
% figure,plot((abs(I_fft(M,:))));title('中间行频谱图');
% 
% figure;
% imshow(log(1+abs(I_fft)),[]);title('频谱图');
% 
% figure;
% imshow(log(1+abs(jipin)),[]);title('基频转移至中心');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH2=PH2.*mask0;


% figure,imshow(mat2gray(uff));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('I:\511\xin\511\新建文件夹 (3)\5.bmp');
a=im2double(a);
a1=imread('I:\511\xin\511\新建文件夹 (3)\6.bmp');
a1=im2double(a1);

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
[m,n]=size(fr);
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
        uf1(i,j)=fr(i,j)/(br(i,j)+eps);
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
        end
    end
end
for i=1:m
    for j=1:n
        uf2(i,j)=fg(i,j)/(bg(i,j)+eps);
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end
for i=1:m
    for j=1:n
        uf3(i,j)=fb(i,j)/(bb(i,j)+eps);
        if uf3(i,j)>1||uf3(i,j)<-1
            uf3(i,j)=0;
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
uf1=uf1.*mask1;
uf2=uf2.*mask2;
uf3=uf3.*mask3;

uff=uf1+uf2+uf3;
I1=uff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(uff(i*2,j*2)+uff(i*2,j*2+1)+uff(i*2+1,j*2)+uff(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end
I1=i1t;

mask0=maskt;
I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(I1);
i1t=zeros(m-1,n-1);
mt=zeros(m-1,n-1);
for i=1:m-1
    for j=1:n-1
        i1t(i,j)=I1(i,j);
        mt(i,j)=mask0(i,j);
    end
end
I1=i1t;
mask0=mt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2-1,n/2-1);
maskt=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(I1(i*2,j*2)+I1(i*2,j*2+1)+I1(i*2+1,j*2)+I1(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        maskt(i,j)=mask0(i*2-1,j*2-1);
    end
end
I1=i1t;

mask0=maskt;
I1=I1-comp1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1=I1.*mask0;

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
% % figure,imshow(mat2gray(I1));

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
win=zeros(m,n);
for j=N:n
    win(:,j)=1/2-1/2*cos((pi/K)*j-pi/K*N);
end
for j=floor(K*(N/K+1)):n
    win(:,j)=1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:(2*W+1)
    for j=1:(2*W+1)
        Lv1(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (i - (W+1)) / (2*W)));
        Lv2(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (j - (W+1)) / (2*W)));
     end
end
Window=-(Lv1.*Lv2);

% for i=1:2*W+1
%     for j=1:2*W+1
%         win(M-W+i,J-W+j)=Window(i,j)+1;
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

jipin=I_fft.*win;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%jipin(:,N+K:n)=I_fft(:,N+K:n);

jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH3=wrapped_Phase;

%figure,imshow(mat2gray(uf3));
%figure,imshow(mat2gray(wrapped_Phase));
% pp=log(1+abs(I_fft));
% figure,plot((abs(I_fft(M,:))));title('中间行频谱图');
% 
% figure;
% imshow(log(1+abs(I_fft)),[]);title('频谱图');
% 
% figure;
% imshow(log(1+abs(jipin)),[]);title('基频转移至中心');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH3=PH3.*mask0;


 figure,imshow(mat2gray(PH1));
  figure,imshow(mat2gray(PH2));
   figure,imshow(mat2gray(PH3));
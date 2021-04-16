clc
clear
%%%%%%%%蓝光cuftp，单光栅加白
a=imread('G:\925\新建文件夹 (13)\1.bmp');
a=im2double(a);
b=imread('G:\925\新建文件夹 (13)\7.bmp');
b=im2double(b);
comp1=0.1;
bdt=3;
comp=1.0;
b1=b(:,:,bdt);
fr=a(:,:,1);
fg=a(:,:,2);
fb=a(:,:,3);

% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=b(:,:,1)./comp;
bg=b(:,:,2)./comp;
bb=b(:,:,3)./comp;
[m,n]=size(fr);
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
% 
for i=1:m
    for j=1:n
        uf1(i,j)=(2*fr(i,j)-br(i,j))/(br(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        uf2(i,j)=(2*fg(i,j)-bg(i,j))/(bg(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        uf3(i,j)=(2*fb(i,j)-bb(i,j))/(bb(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf3(i,j)>1||uf3(i,j)<-1
            uf3(i,j)=0;
        end
    end
end


uf3=uf3+comp1;
uf1=uf1.*mask1;
uf2=uf2.*mask2;
uf3=uf3.*mask3;
uff=uf1+uf2+uf3;
I1=uff;

% figure,imshow(mat2gray(br));
% figure,imshow(mat2gray(bg));
% figure,imshow(mat2gray(bb));

% figure,imshow(mat2gray(mask1));
% figure,imshow(mat2gray(mask2));
% figure,imshow(mat2gray(mask3));

% figure,imshow(mat2gray(fr));
% figure,imshow(mat2gray(fg));
% figure,imshow(mat2gray(fb));

% figure,imshow(mat2gray(uf1));
% figure,imshow(mat2gray(uf2));
% figure,imshow(mat2gray(uf3));
% % figure,imshow(mat2gray(I1));
% figure,imshow(mat2gray(uff));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('G:\925\新建文件夹 (13)\3.bmp');
a=im2double(a);
b=imread('G:\925\新建文件夹 (13)\7.bmp');
b=im2double(b);
bdt=1;
comp=1.0;
b1=b(:,:,bdt);
fr=a(:,:,1);
fg=a(:,:,2);
fb=a(:,:,3);

% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=b(:,:,1)./comp;
bg=b(:,:,2)./comp;
bb=b(:,:,3)./comp;
[m,n]=size(fr);
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
% 
for i=1:m
    for j=1:n
        uf1(i,j)=(2*fr(i,j)-br(i,j))/(br(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        uf2(i,j)=(2*fg(i,j)-bg(i,j))/(bg(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        uf3(i,j)=(2*fb(i,j)-bb(i,j))/(bb(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf3(i,j)>1||uf3(i,j)<-1
            uf3(i,j)=0;
        end
    end
end


uf3=uf3+comp1;
uf1=uf1.*mask1;
uf2=uf2.*mask2;
uf3=uf3.*mask3;
uff=uf1+uf2+uf3;
I2=uff;

% figure,imshow(mat2gray(br));
% figure,imshow(mat2gray(bg));
% figure,imshow(mat2gray(bb));

% figure,imshow(mat2gray(mask1));
% figure,imshow(mat2gray(mask2));
% figure,imshow(mat2gray(mask3));

% figure,imshow(mat2gray(fr));
% figure,imshow(mat2gray(fg));
% figure,imshow(mat2gray(fb));

% figure,imshow(mat2gray(uf1));
% figure,imshow(mat2gray(uf2));
% figure,imshow(mat2gray(uf3));
% % figure,imshow(mat2gray(I1));
% figure,imshow(mat2gray(uff));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('G:\925\新建文件夹 (13)\5.bmp');
a=im2double(a);
b=imread('G:\925\新建文件夹 (13)\7.bmp');
b=im2double(b);
bdt=1;
comp=1.0;
b1=b(:,:,bdt);
fr=a(:,:,1);
fg=a(:,:,2);
fb=a(:,:,3);

% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=b(:,:,1)./comp;
bg=b(:,:,2)./comp;
bb=b(:,:,3)./comp;
[m,n]=size(fr);
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
% 
for i=1:m
    for j=1:n
        uf1(i,j)=(2*fr(i,j)-br(i,j))/(br(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        uf2(i,j)=(2*fg(i,j)-bg(i,j))/(bg(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf2(i,j)>1||uf2(i,j)<-1
            uf2(i,j)=0;
        end
    end
end

for i=1:m
    for j=1:n
        uf3(i,j)=(2*fb(i,j)-bb(i,j))/(bb(i,j)+eps);
    end
end
for i=1:m
    for j=1:n
        if uf3(i,j)>1||uf3(i,j)<-1
            uf3(i,j)=0;
        end
    end
end


uf3=uf3+comp1;
uf1=uf1.*mask1;
uf2=uf2.*mask2;
uf3=uf3.*mask3;
uff=uf1+uf2+uf3;
I3=uff;

% figure,imshow(mat2gray(br));
% figure,imshow(mat2gray(bg));
% figure,imshow(mat2gray(bb));

% figure,imshow(mat2gray(mask1));
% figure,imshow(mat2gray(mask2));
% figure,imshow(mat2gray(mask3));

% figure,imshow(mat2gray(fr));
% figure,imshow(mat2gray(fg));
% figure,imshow(mat2gray(fb));

% figure,imshow(mat2gray(uf1));
% figure,imshow(mat2gray(uf2));
% figure,imshow(mat2gray(uf3));
% % figure,imshow(mat2gray(I1));
% figure,imshow(mat2gray(uff));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I1);
i1t=zeros(m/2,n/2);
i2t=zeros(m/2,n/2);
i2t=zeros(m/2,n/2);
i3t=zeros(m/2,n/2);
for i=1:m/2
    for j=1:n/2
        i1t(i,j)=I1(i*2-1,j*2-1);
    end
end
for i=1:m/2
    for j=1:n/2
        i2t(i,j)=I2(i*2-1,j*2-1);
    end
end
for i=1:m/2
    for j=1:n/2
        i3t(i,j)=I3(i*2-1,j*2-1);
    end
end
I1=i1t;
I2=i2t;
I3=i3t;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,imshow(mat2gray(I1));
figure,imshow(mat2gray(I2));
figure,imshow(mat2gray(I3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(b1);
mask=ones(m,n);
dt=20/255;
% for i=1:m
%     for j=1:n
%         %if b1(i,j)<dt||b2(i,j)<dt||b3(i,j)<dt
%         if b1(i,j)<dt;
%             mask(i,j)=0;
%         end
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maskt=zeros(m/2,n/2);
for i=1:m/2
    for j=1:n/2
        maskt(i,j)=mask(i*2-1,j*2-1);
    end
end
mask=maskt;
%%%%%%%%%%%%%%%%%%%%%%%%
I1=I1.*mask;
I2=I2.*mask;
I3=I3.*mask;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K=3;
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
figure,imshow(mat2gray(wrapped_Phase));
pp=log(1+abs(I_fft));
figure,plot((abs(I_fft(M,:))));title('中间行频谱图');

figure;
imshow(log(1+abs(I_fft)),[]);title('频谱图');

figure;
imshow(log(1+abs(jipin)),[]);title('基频转移至中心');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I_fft=fftshift(fft2(I2));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH2=wrapped_Phase;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I_fft=fftshift(fft2(I3));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位

PH3=wrapped_Phase;
[height,width]=size(PH3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH1=PH1.*mask;
PH2=PH2.*mask;
PH3=PH3.*mask;

figure,imshow(mat2gray(PH1));
figure,imshow(mat2gray(PH2));
figure,imshow(mat2gray(PH3));
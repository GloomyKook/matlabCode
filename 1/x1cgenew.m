% clc
% clear
%%%%%%%%%%%%%%%��ͨ��3Ƶ�ʣ�pi�������ɰ�

%E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���

a=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\1.bmp');
a=im2double(a);
a1=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\2.bmp');
a1=im2double(a1);
%b=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\7.bmp');
b=a+a1;
b=im2double(b);
dt=3;
comp=1;
comp1=0.0;%%%%%%%%%%%%%ȥ��Ƶ
yuzhi=10;
fr=a(:,:,dt)-a1(:,:,dt);


% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=b(:,:,dt)./comp;
%br(br>1)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(fr);
uf1=zeros(m,n);



mask0=ones(m,n);


uf1=zeros(m,n);
uf1=im2double(uf1);

for i=1:m
    for j=1:n
        uf1(i,j)=fr(i,j)/(br(i,j)+eps);
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
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

uff=uf1;
I1=uf1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������������1/4
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������������1/4
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

figure,imshow(mat2gray(mask0));
 
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
K=3;
[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % �渵��Ҷ�任
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % �õ��۵���λ

PH1=wrapped_Phase;

%figure,imshow(mat2gray(uf3));
%figure,imshow(mat2gray(wrapped_Phase));
pp=log(1+abs(I_fft));
figure,plot((abs(I_fft(M,:))));title('�м���Ƶ��ͼ');

figure;
imshow(log(1+abs(I_fft)),[]);title('Ƶ��ͼ');

figure;
imshow(log(1+abs(jipin)),[]);title('��Ƶת��������');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH1=PH1.*mask0;


 figure,imshow(mat2gray(uff));
 
 figure,imshow(mat2gray(PH1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\3.bmp');
a=im2double(a);
a1=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\4.bmp');
a1=im2double(a1);
%b=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\7.bmp');
b=a+a1;
b=im2double(b);

fr=a(:,:,dt)-a1(:,:,dt);


% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=b(:,:,dt)./comp;
%br(br>1)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(fr);
uf1=zeros(m,n);



mask0=ones(m,n);


uf1=zeros(m,n);
uf1=im2double(uf1);

for i=1:m
    for j=1:n
        uf1(i,j)=fr(i,j)/(br(i,j)+eps);
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
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

uff=uf1;
I1=uf1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������������1/4
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������������1/4
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


 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % �渵��Ҷ�任
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % �õ��۵���λ

PH2=wrapped_Phase;

%figure,imshow(mat2gray(uf3));
%figure,imshow(mat2gray(wrapped_Phase));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH2=PH2.*mask0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\5.bmp');
a=im2double(a);
a1=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\6.bmp');
a1=im2double(a1);
%b=imread('E:\�½��ļ��� (13)\�½��ļ��� (7)\�½��ļ���\7.bmp');
b=a+a1;
b=im2double(b);

fr=a(:,:,dt)-a1(:,:,dt);

%yuzhi=120;
% imshow(fr);
% figure,imshow(fg);
% figure,imshow(fb);
% figure,imshow(a);

br=b(:,:,dt)./comp;
%br(br>1)=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(fr);
uf1=zeros(m,n);



mask0=ones(m,n);


uf1=zeros(m,n);
uf1=im2double(uf1);

for i=1:m
    for j=1:n
        uf1(i,j)=fr(i,j)/(br(i,j)+eps);
        if uf1(i,j)>1||uf1(i,j)<-1
            uf1(i,j)=0;
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

uff=uf1;
I1=uf1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������������1/4
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������������1/4
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


 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(I1);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I1));
a=abs(I_fft);
jipin=zeros(m,n);
jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);
jipin_ifft=(ifft2(ifftshift(jipin)));  % �渵��Ҷ�任
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % �õ��۵���λ

PH3=wrapped_Phase;

%figure,imshow(mat2gray(uf3));
%figure,imshow(mat2gray(wrapped_Phase));

% pp=log(1+abs(I_fft));
% figure,plot((abs(I_fft(M,:))));title('�м���Ƶ��ͼ');
% 
% figure;
% imshow(log(1+abs(I_fft)),[]);title('Ƶ��ͼ');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH3=PH3.*mask0;

figure,imshow(mat2gray(PH2));
figure,imshow(mat2gray(PH3));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PH1=mat2gray(PH1);
% PH2=mat2gray(PH2);
% PH3=mat2gray(PH3);
% imwrite(PH1,'I:\�½��ļ��� (2)\1.bmp');
% imwrite(PH2,'I:\�½��ļ��� (2)\2.bmp');
% imwrite(PH3,'I:\�½��ļ��� (2)\3.bmp');
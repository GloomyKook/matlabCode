clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%两图
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=imread('G:\56总\新建文件夹 (2)\新建文件夹 (2)\新建文件夹 (3)\1.bmp');
I1=imread('G:\56总\新建文件夹 (2)\新建文件夹 (2)\新建文件夹 (3)\2.bmp');
I=I(:,:,dt);
I=im2double(I);
I1=I1(:,:,dt);
I1=im2double(I1);
I01=(I-I1)/2;
%%%%%%%%%%%
I=imread('G:\56总\新建文件夹 (2)\新建文件夹 (2)\新建文件夹 (3)\3.bmp');
I1=imread('G:\56总\新建文件夹 (2)\新建文件夹 (2)\新建文件夹 (3)\4.bmp');
I=I(:,:,dt);
I=im2double(I);
I1=I1(:,:,dt);
I1=im2double(I1);
I02=(I-I1)/2;
%%%%%%%%%%%
I=imread('G:\56总\新建文件夹 (2)\新建文件夹 (2)\新建文件夹 (3)\5.bmp');
I1=imread('G:\56总\新建文件夹 (2)\新建文件夹 (2)\新建文件夹 (3)\6.bmp');
I=I(:,:,dt);
I=im2double(I);
I1=I1(:,:,dt);
I1=im2double(I1);
I03=(I-I1)/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [m,n]=size(I01);
% wt=imread('G:\56总\新建文件夹 (2)\新建文件夹 (2)\新建文件夹 (3)\7.bmp');
% wt=wt(:,:,dt);
% wt=im2double(wt);
%     for i=1:m
%         for j=1:n
%             I01(i,j)=I01(i,j)/(wt(i,j)./2+eps);
%         end
%     end
%         for i=1:m
%         for j=1:n
%             I02(i,j)=I02(i,j)/(wt(i,j)./2+eps);
%         end
%         end
%         for i=1:m
%         for j=1:n
%             I03(i,j)=I03(i,j)/(wt(i,j)./2+eps);
%         end
%     end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%一图
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I=imread('C:\Users\liu\Desktop\数据\新建文件夹\1.bmp');
% I=I(:,:,1);
% I=im2double(I);
% I=I-0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(I01);
mask=zeros(m,n);
% for i=1:m
%     for j=1:n
%         if I(i,j)<50/255;
%             mask(i,j)=0;
%         else
%             mask(i,j)=1;
%         end
%     end
% end
% I01=I01.*mask;
% I02=I02.*mask;
% I03=I03.*mask;
% figure,imshow(mat2gray(I01));
% figure,imshow(mat2gray(mask));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
[m,n]=size(I);
i1t=zeros(m/2,n/2);
i2t=zeros(m/2,n/2);
i2t=zeros(m/2,n/2);
i3t=zeros(m/2,n/2);
for i=1:m/2
    for j=1:n/2
        i1t(i,j)=I01(i*2-1,j*2-1);
    end
end
for i=1:m/2
    for j=1:n/2
        i2t(i,j)=I02(i*2-1,j*2-1);
    end
end
for i=1:m/2
    for j=1:n/2
        i3t(i,j)=I03(i*2-1,j*2-1);
    end
end
I01=i1t;
I02=i2t;
I03=i3t;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[height,width]=size(I01);
K=3;
[m,n]=size(I01);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I01));
a=abs(I_fft);

ceshi=abs(I_fft);

T= 1;
[maxvalue,zuobiao]=max(abs(I_fft(M,N+T:end)));
zuobiao=N+T+zuobiao-1;
W=18;
for i=1:(2*W+1)
    for j=1:(2*W+1)
        Lv1(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (i - (W+1)) / (2*W)));
        Lv2(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (j - (W+1)) / (2*W)));
     end
end
Window=(Lv1.*Lv2);
%Window=ones(2*W+1,2*W+1); 
%figure;mesh(Window);title('滤波器');
jipin=zeros(m,n);
%jipin(M-W:M+W,N-W:N+W)=I_fft(M-W:M+W,zuobiao-W:zuobiao+W).*Window;  %取基频
%jipin(M-W:M+W,zuobiao-W:zuobiao+W)=I_fft(M-W:M+W,zuobiao-W:zuobiao+W).*Window;

jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);

jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位


PH1=wrapped_Phase;
figure,imshow(mat2gray(I03));
figure,imshow(mat2gray(wrapped_Phase));

figure;
imshow(log(1+abs(I_fft)),[]);title('频谱图');
pp=log(1+abs(I_fft));
figure,plot((abs(I_fft(M,:))));title('中间行频谱图');
figure;
imshow(log(1+abs(jipin)),[]);title('基频转移至中心');


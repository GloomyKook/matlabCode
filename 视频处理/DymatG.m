clc
clear

dt=1;


a=im2double(imread('F:\623\20200622_215427_BMP\1.bmp'));
[m,n]=size(a);
a1=zeros(m/2-1,n/2-1);
for j=1:n/2-1
    a1(:,j)=(2.49-1.8)/(375-297)*(j-297)+1.8;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% F=15;
% fmat=moviein(F);
% fig=figure;
% aviobj=VideoWriter('example.avi');
% aviobj.FrameRate=20;%set FrameRate before open it
% open(aviobj);

F=120;

fig=figure;
aviobj=VideoWriter('example5.avi');
aviobj.FrameRate=30;%set FrameRate before open it
open(aviobj);

time=0.05;
fmat=moviein(F);


for fx=1:F
%fx=1

%%%%%%%%%%%%%%%单通道3频率，pi相移生成白

%E:\QYL\新建文件夹\20200418_172549_BMP\新建文件夹
%tic
fx0=(fx-1)*4;



% I1=im2double(imread('F:\623\20200622_215427_BMP\',num2str(fx0+1),'.bmp'));
% I2=im2double(imread('F:\623\20200622_215427_BMP\',num2str(fx0+2),'.bmp'));
% I3=im2double(imread('F:\623\20200622_215427_BMP\',num2str(fx0+3),'.bmp'));
% I4=im2double(imread('F:\623\20200622_215427_BMP\',num2str(fx0+4),'.bmp'));

I1=im2double(imread(['F:\623\20200622_215427_BMP\',num2str(fx0+1),'.bmp']));
I2=im2double(imread(['F:\623\20200622_215427_BMP\',num2str(fx0+2),'.bmp']));
I3=im2double(imread(['F:\623\20200622_215427_BMP\',num2str(fx0+3),'.bmp']));
I4=im2double(imread(['F:\623\20200622_215427_BMP\',num2str(fx0+4),'.bmp']));



I1=I1(:,:,dt);
I2=I2(:,:,dt);
I3=I3(:,:,dt);
I4=I4(:,:,dt);

%figure,imshow(mat2gray(I1));

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

[m,n]=size(I1);
a2=zeros(m,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for x=1:m
    for y=1:n
        a2(x,y)=atan2(I2(x,y)-I4(x,y),I1(x,y)-I3(x,y));
    end
end
PH1=a2;

%imshow(mat2gray(PH1));

a18=a1.*18;
T=zeros(m,n);

for i=1:m
    for j=1:n
        T(i,j)=round((a18(i,j)-a2(i,j))/2*pi);
        T(i,j)=round(T(i,j)./10);
    end
end


pha1=T.*2*pi+a2;
pha2=a18;
phf=-(pha2-pha1);
 phf=medfilt2(phf,[5,5]);
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%对称
phfjc=zeros(m,n);
for i=1:m
    for j=1:n
        phfjc(i,j)=phf(m-i+1,j);
    end
end
phf=phfjc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
phf(1,1)=3;
phf(1,2)=-3;

 mesh(phf);
 

 
  %view(-37.5,60)
  view(-10,80)
%       camlight;
% lighting phong;
 
%  k=[num2str(fx),'.mat'];
% save(k,'phf');

MOV=getframe(fig);
    writeVideo(aviobj,MOV);

%pause(time);

%toc
end
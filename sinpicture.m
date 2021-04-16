clc;
clear;
%得到N个周期均匀的光栅图像
%p=5;
m=menu('请选择相移角度','相移0','相移p/4','相移p/2','相移3p/4');
x=linspace(0,1,1140);
N=56;
fai=N*2*pi*x+(m-1)*pi/2;
grating1=zeros(1140,912);
grating1=mat2gray(grating1);
grating2=zeros(1140,912);
grating2=mat2gray(grating2);
grating3=zeros(1140,912);
grating3=mat2gray(grating3);
grating4=zeros(1140,912);
grating4=mat2gray(grating4);
a=1.2;
for i=1:1140
% grating(:,i)=((sin(fai(i))+1)/2).*255;
grating1(i,:)=((sin(fai(i)+pi/2)+1)/2).^(1/a);
grating2(i,:)=((sin(fai(i)+pi/2+pi/2)+1)/2).^(1/a);
grating3(i,:)=((sin(fai(i)+pi+pi/2)+1)/2).^(1/a);
grating4(i,:)=((sin(fai(i)+pi*3/2+pi/2)+1)/2).^(1/a);
end
% figure(1),plot(grating);
% I2=repmat(i2.^(1/a)*255,768,1);
%grating=grating;
% image(grating);
% set(gca,'units','normalized','position',[0 0 1 1],'xtick',[],'ytick',[])
% % set(1,'units','normalize','position',[0 0 1 1]) %原始图象就是最大，与上语句同时使用
% colormap(gray(255));
%imshow(grating1);%%%%%%%%%%%%%%%%%%%%%%%%%%
imwrite(grating1,'G:\grating\1.bmp.bmp');
% imwrite(grating2,'E:\zhao\新建文件夹 (16)\10.bmp');
% imwrite(grating3,'E:\zhao\新建文件夹 (16)\11.bmp');
% imwrite(grating4,'E:\zhao\新建文件夹 (16)\12.bmp');
%%%%%%%%%%%%%%%%%%%
gra=grating1';
figure,imshow(gra);
%%%%%%%%%%%%%%%%%%%
%imshow(grating1);
% dlmwrite('grating4.txt',grating)
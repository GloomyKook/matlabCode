%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main file to  four phase shfit and three frequency
% by Zhuan yuhao

clc;
clear;
close all;

bmp = ('.bmp');

dt=2; %%%选取彩色图片的G通道，若是黑白图片请改为1

T1=64;
T2=63;   %三组频率
T3=56;

%导入物体图片

objectDir = ('G:\grating\新建文件夹 (6)\新建文件夹\');
objectFile = cell(1,12);

for i1=1:12
    objectFile{1,i1} = ([objectDir,num2str(i1),bmp]);
end

%导入平面图片

planeDir = ('G:\grating\新建文件夹 (6)\');

planeFile = cell(1,12);
for i2=1:12
planeFile{1,i2} = ([planeDir,num2str(i2),bmp]);
end






PF = objPhase - planePhase;
  PF=medfilt2(PF,[5,5]);
  PF=medfilt2(PF,[5,5]);
  PF=medfilt2(PF,[5,5]);
figure,mesh(PF);
camlight;
lighting phong;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main file to  four phase shfit and three frequency
% by Zhuan yuhao

clc;
clear;
close all;

bmp = ('.bmp');

dt=2; %%%ѡȡ��ɫͼƬ��Gͨ�������Ǻڰ�ͼƬ���Ϊ1

T1=64;
T2=63;   %����Ƶ��
T3=56;

%��������ͼƬ

objectDir = ('G:\grating\�½��ļ��� (6)\�½��ļ���\');
objectFile = cell(1,12);

for i1=1:12
    objectFile{1,i1} = ([objectDir,num2str(i1),bmp]);
end

%����ƽ��ͼƬ

planeDir = ('G:\grating\�½��ļ��� (6)\');

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


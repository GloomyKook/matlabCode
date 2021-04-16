% clc;
% clear;
% close;

bmp = ('.bmp');

dt=2; %%%选取彩色图片的G通道，若是黑白图片请改为1

T1=64;
T2=63;   %三组频率
T3=56;

%导入竖直条纹图

XDir = ('G:\grating\20210401\shu\1\');
XobjectFile = cell(1,12);

for i1=1:12
    XobjectFile{1,i1} = ([XDir,num2str(i1),bmp]);
end

%导入水平条纹图

YDir = ('G:\grating\20210401\heng\1\');

YobjectFile = cell(1,12);
for i2=1:12
YobjectFile{1,i2} = ([YDir,num2str(i2),bmp]);
end
phX= phaseAlgorithm(XobjectFile,dt,T1,T2,T3);
phY = phaseAlgorithm(YobjectFile,dt,T1,T2,T3);




% delimiterIn = ';';
% h =1
% present01 =importdata('123.txt',delimiterIn,h);
readData = fopen('123.txt','r');

data1 = round(Untitled);
[m,n] = size(data1);


ph1obj =[];
ph2obj =[];
coord =[];
for i1=1:m
    x= data1(i1,1);
    y= data1(i1,2);
    ph1obj(i1)= phX(y,x);
    ph2obj(i1)= phY(y,x);
end

for i2=1:m
    coord(i2,2)=round(ph1obj(i2)/(2*pi)*912);
    coord(i2,1)=round(ph2obj(i2)/(2*pi)*1140);
end

fid = fopen('data.txt','wt');
 for i=1:1:m

   for j=1:1:n

      if j==n

        fprintf(fid,'%g\n',coord(i,j));

     else

       fprintf(fid,'%g\t',coord(i,j));

      end

   end

end

fclose(fid);


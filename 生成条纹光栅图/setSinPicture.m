
m = menu('请选择相移角度','相移0','相移P/2','相移P','相移3P/4');
x = linspace(0,1,1140); %投影仪的分辨率是1140*912
fai = N*2*pi*x+(m-1)*pi/2;
grating1 = zeros(1140,912);
grating1 = mat2gray(grating1);
% grating2 = zeros(1140,912);
% grating2 = mat2gray(grating2);
% grating3 = zeros(1140,912);
% grating3 = mat2gray(grating3);
% grating4 = zeros(1140,912);
% grating4 = mat2gray(grating4);

a = 1.2;   %为了去除伽马效应，现在用的投影仪5400可以不用

for i=1:1140
    grating1(i,:) = ((sin(fai(i)+pi/2)+1)/2);%.^(1/a);
end
gra =grating1';
figure,imshow(gra);
clc;
clear;
close all;
picture = zeros(10,10);
for i=1:10
    picture(i,:) = i;
end
c = imread('G:\123.bmp');
I = rgb2gray(c);
figure,imshow(c);
m = zeros(1,255);

for j = 1:255
    a = (c ==j);
    n = sum (a(:));
    m(j)= n;
end

%indmin = find(diff(sign(diff(m)))>0)+1;

% x =linspace(0.2*pi,81*pi*2);
% y = 200*sin(x)
% plot(x,y);




 

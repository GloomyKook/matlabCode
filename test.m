clc;
clear;
close all;
% I1 =zeros(10,10);
% I3 =zeros(10,10);
% for i=1:10
%     I1(i,:) = 1;
%     I3(i,:) = 3;
% end
% 
% I13 = I1.*I3;
% I33 = I3.*I3;
% sum13 = sum(I13(:));
% sum33  =sum(I33(:));
% k = sum13/sum33;
I1 = imread('G:\111.png');
I = rgb2gray(I1);
A = im2bw(I,0.9); %�Զ�ȷ����ֵ����ֵ
 figure,imshow(A);
  figure,imshow(~A);
[L,n] = bwlabel(A,8);%�����ͨ���� ��n����ͨ�����
for k =1:n
    [x,y] = find(L==k);%�ҵ�L��k������
    p(k,:)= vpa([mean(x),mean(y)],4);%mean����ƽ��ֵ 
    b(k,:)= round([mean(x),mean(y)]);
    I(b(k,1),b(k,2),:)=0;
end
p;
imtool(I);
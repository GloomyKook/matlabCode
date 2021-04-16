clc;
clear all;
close all;

C =cell(3,4);
 m=zeros(5,5,3);
 x=[];
 y=[];
 z=[];
 n=0;
for i=1:5
    for j=1:5
        m(i,j,1)=1;
        m(i,j,2)=2;
        m(i,j,3)=3;
       n= n+1;
        x=(5 n);
        y= [5 n];
        z=[5 n];
    end
end
 plot3(x,y,z);
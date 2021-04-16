clc ;
clear;
close all;

 picture = imread('G:\rgb1.jpg');
figure,imshow(picture);
 
  I = rgb2gray(picture);
  figure,imshow(I);
%  
 
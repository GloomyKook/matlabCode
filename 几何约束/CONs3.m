% I4=im2double(imread('I:\615\6151\新建文件夹 (3)\4.bmp'));
% I3=im2double(imread('I:\615\6151\新建文件夹 (3)\3.bmp'));
% I2=im2double(imread('I:\615\6151\新建文件夹 (3)\2.bmp'));
% I1=im2double(imread('I:\615\6151\新建文件夹 (3)\1.bmp'));
% 
% I1=I1(:,:,dt);
% I2=I2(:,:,dt);
% I3=I3(:,:,dt);
% I4=I4(:,:,dt);
% 
% %figure,imshow(mat2gray(I1));
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%减少像素数至1/4
% [m,n]=size(I1);
% i1t=zeros(m/2-1,n/2-1);
% i2t=zeros(m/2-1,n/2-1);
% i3t=zeros(m/2-1,n/2-1);
% i4t=zeros(m/2-1,n/2-1);
% for i=1:m/2-1
%     for j=1:n/2-1
%         i1t(i,j)=(I1(i*2,j*2)+I1(i*2,j*2+1)+I1(i*2+1,j*2)+I1(i*2+1,j*2+1))/4;
%     end
% end
% 
% for i=1:m/2-1
%     for j=1:n/2-1
%         i2t(i,j)=(I2(i*2,j*2)+I2(i*2,j*2+1)+I2(i*2+1,j*2)+I2(i*2+1,j*2+1))/4;
%     end
% end
% for i=1:m/2-1
%     for j=1:n/2-1
%         i3t(i,j)=(I3(i*2,j*2)+I3(i*2,j*2+1)+I3(i*2+1,j*2)+I3(i*2+1,j*2+1))/4;
%     end
% end
% for i=1:m/2-1
%     for j=1:n/2-1
%         i4t(i,j)=(I4(i*2,j*2)+I4(i*2,j*2+1)+I4(i*2+1,j*2)+I4(i*2+1,j*2+1))/4;
%     end
% end
% I1=i1t;
% I2=i2t;
% I3=i3t;
% I4=i4t;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% [m,n]=size(I1);
% a2=zeros(m,n);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for x=1:m
%     for y=1:n
%         a2(x,y)=atan2(I2(x,y)-I4(x,y),I1(x,y)-I3(x,y));
%     end
% end
% PH1=a2;
% figure,imshow(mat2gray(PH1));
% 
% phad=pha1-0.1;
% phau=pha1+2*pi;
% 
% T1=zeros(m,n);
% 
% % for i=1:m
% %     for j=1:n
% %         T1(i,j)=ceil((phad(i,j)-a2(i,j))./2*pi);
% %       %          T1(i,j)=floor((phau(i,j)-a2(i,j))./2*pi);
% % 
% %         T1(i,j)=round(T1(i,j)./10);
% %     end
% % end
% 
% 
% 
% tic
% for i=1:m
%     for j=1:n
%         T1(i,j)=ceil((pha1(i,j)-a2(i,j))./2*pi);
%       %          T1(i,j)=floor((phau(i,j)-a2(i,j))./2*pi);
% 
%         T1(i,j)=round(T1(i,j)./10);
%     end
% end
% toc
% pha2=a2+T1.*2*pi;
% 
% %%%%%%%%%%%%%%%%%%%
% for i=1:m
%     for j=1:n
%         if pha2(i,j)<phad(i,j)
%             pha2(i,j)=pha2(i,j)+2*pi;
%         end
%     end
% end
% % for i=1:m
% %     for j=1:n
% %         if pha2(i,j)>phau(i,j)
% %             pha2(i,j)=pha2(i,j)-2*pi;
% %         end
% %     end
% % end
% %%%%%%%%%%%%%%%%%%
% 
% 
% figure,imshow(mat2gray(T1));
% 
% 
% figure,imshow(mat2gray(pha2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pha2=a18;

phf=-(pha2-pha1);


 phf=medfilt2(phf,[5,5]);
phf=medfilt2(phf,[5,5]);

figure,mesh(phf);

camlight;
lighting phong;
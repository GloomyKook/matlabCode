%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%两图
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I=imread('G:\final\6231\新建文件夹\5.bmp');
% I1=imread('G:\final\6231\新建文件夹\7.bmp');
% I=I(:,:,1);
% I=im2double(I);
% I1=I1(:,:,1);
% I1=im2double(I1);
% I=(I-I1)/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%一图
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I=imread('C:\Users\liu\Desktop\数据\新建文件夹\2.bmp');
% I=I(:,:,1);
% I=im2double(I);
% I=I-0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%K=2;
[m,n]=size(I02);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I02));
a=abs(I_fft);

ceshi=abs(I_fft);

T= 1;
% [maxvalue,zuobiao]=max(abs(I_fft(M,N+T:end)));
% zuobiao=N+T+zuobiao-1;
% W=18;
% for i=1:(2*W+1)
%     for j=1:(2*W+1)
%         Lv1(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (i - (W+1)) / (2*W)));
%         Lv2(i,j)= (0.5 + 0.5 * cos(2.0 * pi * (j - (W+1)) / (2*W)));
%      end
% end
% Window=(Lv1.*Lv2);
%Window=ones(2*W+1,2*W+1); 
%figure;mesh(Window);title('滤波器');
jipin=zeros(m,n);
%jipin(M-W:M+W,N-W:N+W)=I_fft(M-W:M+W,zuobiao-W:zuobiao+W).*Window;  %取基频
%jipin(M-W:M+W,zuobiao-W:zuobiao+W)=I_fft(M-W:M+W,zuobiao-W:zuobiao+W).*Window;

jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);

jipin_ifft=(ifft2(ifftshift(jipin)));  % 逆傅立叶变换
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % 得到折叠相位


PH2=wrapped_Phase;
figure,imshow(mat2gray(wrapped_Phase));


%figure;imshow(log(1+abs(I_fft)),[]);title('频谱图');
%pp=log(1+abs(I_fft));
%figure,plot((abs(I_fft(M,:))));title('中间行频谱图');

%figure;imshow(log(1+abs(jipin)),[]);title('基频转移至中心');


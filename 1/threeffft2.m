%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ͼ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I=imread('G:\final\6231\�½��ļ���\5.bmp');
% I1=imread('G:\final\6231\�½��ļ���\7.bmp');
% I=I(:,:,1);
% I=im2double(I);
% I1=I1(:,:,1);
% I1=im2double(I1);
% I=(I-I1)/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%һͼ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I=imread('C:\Users\liu\Desktop\����\�½��ļ���\2.bmp');
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
%figure;mesh(Window);title('�˲���');
jipin=zeros(m,n);
%jipin(M-W:M+W,N-W:N+W)=I_fft(M-W:M+W,zuobiao-W:zuobiao+W).*Window;  %ȡ��Ƶ
%jipin(M-W:M+W,zuobiao-W:zuobiao+W)=I_fft(M-W:M+W,zuobiao-W:zuobiao+W).*Window;

jipin(:,N+K:n)=I_fft(:,N+K:n);
%jipin(:,1:N-K)=I_fft(:,1:N-K);

jipin_ifft=(ifft2(ifftshift(jipin)));  % �渵��Ҷ�任
jp2=jipin_ifft;
%jp2(:,:,1)=fliplr(jp2(:,:,1));
wrapped_Phase=angle(jipin_ifft);  % �õ��۵���λ


PH2=wrapped_Phase;
figure,imshow(mat2gray(wrapped_Phase));


%figure;imshow(log(1+abs(I_fft)),[]);title('Ƶ��ͼ');
%pp=log(1+abs(I_fft));
%figure,plot((abs(I_fft(M,:))));title('�м���Ƶ��ͼ');

%figure;imshow(log(1+abs(jipin)),[]);title('��Ƶת��������');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ͼ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=imread('G:\1222\12221\�½��ļ���\1.bmp');
I1=imread('G:\1222\12221\�½��ļ���\2.bmp');
TD=1;
I=I(:,:,TD);
I=im2double(I);
I1=I1(:,:,TD);
I1=im2double(I1);
I01=(I-I1)/2;
%%%%%%%%%%%
I=imread('G:\1222\12221\�½��ļ���\3.bmp');
I1=imread('G:\1222\12221\�½��ļ���\4.bmp');
I=I(:,:,TD);
I=im2double(I);
I1=I1(:,:,TD);
I1=im2double(I1);
I02=(I-I1)/2;
%%%%%%%%%%%
I=imread('G:\1222\12221\�½��ļ���\5.bmp');
I1=imread('G:\1222\12221\�½��ļ���\6.bmp');
I=I(:,:,TD);
I=im2double(I);
I1=I1(:,:,TD);
I1=im2double(I1);
I03=(I-I1)/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������������1/4
[m,n]=size(I);
i1t=zeros(m/2-1,n/2-1);
i2t=zeros(m/2-1,n/2-1);
i3t=zeros(m/2-1,n/2-1);
for i=1:m/2-1
    for j=1:n/2-1
        i1t(i,j)=(I01(i*2,j*2)+I01(i*2,j*2+1)+I01(i*2+1,j*2)+I01(i*2+1,j*2+1))/4;
    end
end

for i=1:m/2-1
    for j=1:n/2-1
        i2t(i,j)=(I02(i*2,j*2)+I02(i*2,j*2+1)+I02(i*2+1,j*2)+I02(i*2+1,j*2+1))/4;
    end
end
for i=1:m/2-1
    for j=1:n/2-1
        i3t(i,j)=(I03(i*2,j*2)+I03(i*2,j*2+1)+I03(i*2+1,j*2)+I03(i*2+1,j*2+1))/4;
    end
end
I01=i1t;
I02=i2t;
I03=i3t;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%һͼ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I=imread('C:\Users\liu\Desktop\����\�½��ļ���\1.bmp');
% I=I(:,:,1);
% I=im2double(I);
% I=I-0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[height,width]=size(I01);
K=1;
[m,n]=size(I01);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I01));
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


PH1=wrapped_Phase;
%figure,imshow(mat2gray(wrapped_Phase));

%figure;
%imshow(log(1+abs(I_fft)),[]);title('Ƶ��ͼ');
pp=log(1+abs(I_fft));
%figure,plot((abs(I_fft(M,:))));title('�м���Ƶ��ͼ');
%figure;
%imshow(log(1+abs(jipin)),[]);title('��Ƶת��������');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(I01);
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
%figure,imshow(mat2gray(wrapped_Phase));


%figure;imshow(log(1+abs(I_fft)),[]);title('Ƶ��ͼ');
%pp=log(1+abs(I_fft));
%figure,plot((abs(I_fft(M,:))));title('�м���Ƶ��ͼ');

%figure;imshow(log(1+abs(jipin)),[]);title('��Ƶת��������');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(I01);
M=floor(m/2)+1;
N=floor(n/2)+1;
I_fft=fftshift(fft2(I03));
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


PH3=wrapped_Phase;
%figure,imshow(mat2gray(wrapped_Phase));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PH13 = zeros(height,width);
PH23 = zeros(height,width);
PH123 = zeros(height,width);
%size(phi{1,1})
% �������
% ������
% ����
for g = 1:height
	for k =1: width
		% �����һ��͵ڶ�������
		if PH1(g,k)>PH3(g,k)
			PH13(g,k) = PH1(g,k)-PH3(g,k);
		else
			PH13(g,k) = PH1(g,k)+2*pi-PH3(g,k);
		end
		% ����ڶ���͵���������
		if PH2(g,k)>PH3(g,k)
            PH23(g,k) = PH2(g,k)-PH3(g,k);
		else
			PH23(g,k) = PH2(g,k)+2*pi-PH3(g,k);
 	    end
	   % plot(1,k);
	end
end

% �����������
% ���ͼ��
% ��λ�����
for g = 1:height
	for k = 1:width
		if PH13(g,k)>PH23(g,k)
			PH123(g,k) = PH13(g,k)-PH23(g,k);
		else
			PH123(g,k) = PH13(g,k)+2*pi-PH23(g,k);
		end
	end
end
 w = fspecial('gaussian',[15,15],10);
    %PH123=imfilter(PH123,w,'replicate');
% ��ʾ
% figure,imshow(mat2gray(PH1));title('1��λ��ֵ');  
% % imwrite(mat2gray(PH1),'1��λ��ֵ.bmp');  
% figure,imshow(mat2gray(PH2));title('2��λ��ֵ');  
% % imwrite(mat2gray(PH2),'2��λ��ֵ.bmp');  
% figure,imshow(mat2gray(PH3));title('3��λ��ֵ');  
% imwrite(mat2gray(PH3),'3��λ��ֵ.bmp');
% figure,imshow(mat2gray(PH13));title('1,3���');  
% % imwrite(mat2gray(PH13),'13���.bmp');
% figure,imshow(mat2gray(PH23));title('2,3���');  
% % imwrite(mat2gray(PH23),'23���.bmp');
% w = fspecial('gaussian',[20,20],5);
%  %   PH123=imfilter(PH123,w,'replicate');
% figure,imshow(mat2gray(PH123));title('1,2,3���');
%imwrite(mat2gray(PH123),'123���.bmp');

% u=zeros(m,n);
% for x=1:m
%     for y=2:n
%         if abs(PH2(x,y)-PH2(x,y-1))<pi
%             u(x,y)=u(x,y-1);
%        elseif PH2(x,y)-PH2(x,y-1)<pi
%             u(x,y)=u(x,y-1)+1;
%         elseif PH2(x,y)-PH2(x,y-1)>pi
%             u(x,y)=u(x,y-1)-1;
%         end
%     end
% end
% u=u.*2*pi;
% a1=u+PH2;
% 
% figure,imshow(mat2gray(u));
% figure,imshow(mat2gray(a1));

% mask0=zeros(m,n);
% for i=1:m
%     for j=1:n-1
%         if PH2(i,j+1)-PH2(i,j)<-5
%             mask0(i,j)=1;
%         end
%     end
% end
% % for i=1:m
% %     for j=1:n
% %         if 
%  figure,imshow(mat2gray(mask0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T1=64;
% T2=63;
% T3=56;

% T1=100;
% T2=99;
% T3=90;

T13=T1-T3;
T23=T2-T3;
T123=1;

k13=round(((T13/T123).*PH123-PH13)./(2*pi));      % ��λ1,3�������λPH13�����Ƽ���
% k13=k13-repmat(k13(:,1),1,length(k13(1,:)));
JPH13=PH13+k13.*(2*pi);                           % JPH13��PH13��������λ

k23=round(((T23/T123).*PH123-PH23)./(2*pi));      % ��λ2,3�������λPH23�����Ƽ���
% k23=k23-repmat(k23(:,1),1,length(k23(1,:)));
JPH23=PH23+k23.*(2*pi);                           % JPH23��PH23��������λ

                    % JPH56��PH56��������λ

%    %%%%%%%%%%%%%%% PH13 PH23 PH46 PH56 չ�����������λУ��%%%%%%%%%%%%%%%%%%%%
%                 13
%  for g = 1:heigth
%     for k = 2:width
%         if JPH13(g,k)-JPH13(g,k-1)>6
%             JPH13(g,k)=JPH13(g,k)-2*pi;
%            if JPH13(g,k)-JPH13(g,k-1)<-6
%                 JPH13(g,k)=JPH13(g,k)+2*pi;
%             else
%                 JPH13(g,k)=JPH13(g,k);
%             end
%         end
%     end
%  end
% %                  23  
% for g = 1:heigth
%     for k = 2:width
%         if JPH23(g,k)-JPH23(g,k-1)>5.888
%             JPH23(g,k)=JPH23(g,k)-2*pi;
%            if JPH23(g,k)-JPH23(g,k-1)<-5.888
%                 JPH23(g,k)=JPH23(g,k)+2*pi;
%             else
%                 JPH23(g,k)=JPH23(g,k);
%             end
%         end
%     end
% end
%                  46            
%  for g = 1:heigth
%     for k = 2:width
%         if JPH46(g,k)-JPH46(g,k-1)>6
%             JPH46(g,k)=JPH46(g,k)-2*pi;
%            if JPH46(g,k)-JPH46(g,k-1)<-6
%                 JPH46(g,k)=JPH46(g,k)+2*pi;
%             else
%                 JPH46(g,k)=JPH46(g,k);
%             end
%         end
%     end
%  end
% %                  56
%  for g = 1:heigth
%     for k = 2:width
%         if JPH56(g,k)-JPH56(g,k-1)>5.888
%             JPH56(g,k)=JPH56(g,k)-2*pi;
%            if JPH56(g,k)-JPH56(g,k-1)<-5.888
%                 JPH56(g,k)=JPH56(g,k)+2*pi;
%             else
%                 JPH56(g,k)=JPH56(g,k);
%             end
%         end
%     end
%  end

%         %%%%%%%%%%%%%%%% �����Ƽ��� %%%%%%%%%%%%%%%%%%
k1=round(((T1/T13).*JPH13-PH1)./(2*pi));% �ض���λPH1�����Ƽ���
%k11=k1;

%k1=k1-repmat(k1(:,1),1,length(k1(1,:)));
%figure,imshow(mat2gray(k1));
% figure,imshow(mat2gray(k11));
% figure,imshow(mat2gray(PH1));
%figure,imshow(mat2gray(repmat(k1(:,1),1,length(k1(1,:)))));
k2=round(((T2/T23).*JPH23-PH2)./(2*pi));          % �ض���λPH2�����Ƽ���
%k2=k2-repmat(k2(:,1),1,length(k2(1,:)));

k3=round(((T3/T23).*JPH23-PH3)./(2*pi));          % �ض���λPH3�����Ƽ���
%k3=k3-repmat(k3(:,1),1,length(k3(1,:)));



%         %%%%%%%%%%%%%%% �ض���λչ�� %%%%%%%%%%%%%%%%%%%

JPH1=PH1+k1.*(2*pi);    % JPH1Ϊ�ض���λPH1��������λ

 JPH2=PH2+k2.*(2*pi);                              % JPH2Ϊ�ض���λPH2��������λ
 JPH3=PH3+k3.*(2*pi);                              % JPH3Ϊ�ض���λPH3��������λ
                         % JPH6Ϊ�ض���λPH6��������λ

PH123y=zeros(m,n);
for i=1:m
    for j=1:n
        PH123y(i,j)=JPH1(i,j)/T1;
        PH123y(i,j)=(JPH1(i,j)/T1+JPH2(i,j)/T2+JPH3(i,j)/T3)/3;
    end
end
PH123y=PH123y.*T1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ƽ��ɾ��

%PH123JC=PH123y;


 figure,imshow(mat2gray(PH123y));
 
 phf=-(PH123JC-PH123y);
 
 pl=100;
%  for i=1:m
%      for j=1:n
%          if phf(i,j)>40/pl||phf(i,j)<30/pl
%             % if phf(i,j)>0.7||phf(i,j)<0.4
%              phf(i,j)=0;
%          end
%      end
%  end

%  phf=medfilt2(phf,[5,5]);
% phf=medfilt2(phf,[5,5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�����������4��
% phfk=zeros(m*2,n*2);
% for i=1:m
%     for j=1:n
%         phfk(i*2-1,j*2-1)=phf(i,j);
%         phfk(i*2,j*2)=phf(i,j);
%         phfk(i*2-1,j*2)=phf(i,j);
%         phfk(i*2,j*2-1)=phf(i,j);
%     end
% end
% phf=phfk;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 phf=medfilt2(phf,[5,5]);
 phf=medfilt2(phf,[5,5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,mesh(phf);

camlight;
lighting phong;

% clc
% clear
% Dir=dir('C:\Users\Administrator\Desktop\�½��ļ���\*.BMP');
[m1,n1]=size(Dir);
I=imread(['C:\Users\Administrator\Desktop\�½��ļ���\',num2str(m1),'.bmp']);
[m,n]=size(I);
n=n/3;
height=m;
width=n;

C = cell(3,4);  
for i=1:3
    for j=1:4
        C{i,j} = zeros(height,width);
    end
end
for s=1:12
    I=imread(['C:\Users\Administrator\Desktop\�½��ļ���\',num2str(s),'.BMP']);
    if(s<=4)
          C{1,s} = I;
    end
    if(s>4&&s<=8)
          C{2,s-4} = I;
    end
    if(s>8&&s<=12)
          C{3,s-8} = I;
    end    
end

for i=1:3
    for j=1:4
        C{i,j}=C{i,j}(:,:,1);
    end
end

% ��ʼ�����鴦����ͼƬ�ҶȾ���
% phiҲ�Ƿֿ����
% �洢��λ��ֵͼ��

phi = cell(3,1);
for i = 1:3
    phi{i,1} = zeros(height,width);
end
% for i=1:3
%     for j=1:4
%         C{i,j}=C{i,j}.*i0;
%     end
% end
% ��ȡ��λ��
% ����ÿ��Ƶ�ʶ�Ӧ����λ��ֵ
% �������Ƶ�ʵ���λ��ֵ������������

for i = 1:3 % ����3���е�ÿһ��ͼƬ
     I1 =double(C{i,1});
     I2 = double(C{i,2});
     I3 = double(C{i,3});
     I4 = double(C{i,4});
      for g = 1:height
          for k = 1:width          
            if I4(g,k)==I2(g,k)&&I1(g,k)>I3(g,k) %�ĸ�����λ��
                    phi{i,1}(g,k)=0;
            elseif I4(g,k)==I2(g,k)&&I1(g,k)<I3(g,k) %�ĸ�����λ��
                    phi{i,1}(g,k)=pi; 
            elseif I1(g,k)==I3(g,k)&&I4(g,k)>I2(g,k) %�ĸ�����λ��
                    phi{i,1}(g,k)=pi/2;
            elseif I1(g,k)==I3(g,k)&&I4(g,k)<I2(g,k) %�ĸ�����λ��
                    phi{i,1}(g,k)=3*pi/2;
            elseif I1(g,k)<I3(g,k) %��������
                    phi{i,1}(g,k)=atan((I4(g,k)-I2(g,k))./(I1(g,k)-I3(g,k)))+pi;
            elseif I1(g,k)>I3(g,k)&&I4(g,k)>I2(g,k) %��һ����
                    phi{i,1}(g,k)=atan((I4(g,k)-I2(g,k))./(I1(g,k)-I3(g,k)));
            elseif I1(g,k)>I3(g,k)&&I4(g,k)<I2(g,k) %��������
                    phi{i,1}(g,k)=atan((I4(g,k)-I2(g,k))./(I1(g,k)-I3(g,k)))+2*pi;  
            end
          end             
     end
end
  
% �������
% ����������ڶ�Ƶ���ļ���
PH1 = phi{1,1};
PH2 = phi{2,1};
PH3 = phi{3,1};
%figure,imshow(mat2gray(PH1));
% ��ʼ��������
% ��Ƶ���
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
figure,imshow(mat2gray(PH1));title('1��λ��ֵ');  
% imwrite(mat2gray(PH1),'1��λ��ֵ.bmp');  
figure,imshow(mat2gray(PH2));title('2��λ��ֵ');  
% imwrite(mat2gray(PH2),'2��λ��ֵ.bmp');  
figure,imshow(mat2gray(PH3));title('3��λ��ֵ');  
% imwrite(mat2gray(PH3),'3��λ��ֵ.bmp');
figure,imshow(mat2gray(PH13));title('1,3���');  
% imwrite(mat2gray(PH13),'13���.bmp');
figure,imshow(mat2gray(PH23));title('2,3���');  
% imwrite(mat2gray(PH23),'23���.bmp');
w = fspecial('gaussian',[20,20],5);
 %   PH123=imfilter(PH123,w,'replicate');
figure,imshow(mat2gray(PH123));title('1,2,3���');
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
%k2=round(((T2/T23).*JPH23-PH2)./(2*pi));          % �ض���λPH2�����Ƽ���
%k2=k2-repmat(k2(:,1),1,length(k2(1,:)));

%k3=round(((T3/T23).*JPH23-PH3)./(2*pi));          % �ض���λPH3�����Ƽ���
%k3=k3-repmat(k3(:,1),1,length(k3(1,:)));



%         %%%%%%%%%%%%%%% �ض���λչ�� %%%%%%%%%%%%%%%%%%%

JPH1=PH1+k1.*(2*pi);    % JPH1Ϊ�ض���λPH1��������λ

% JPH2=PH2+k2.*(2*pi);                              % JPH2Ϊ�ض���λPH2��������λ
% JPH3=PH3+k3.*(2*pi);                              % JPH3Ϊ�ض���λPH3��������λ
                         % JPH6Ϊ�ض���λPH6��������λ

PH123y=zeros(m,n);
for i=1:m
    for j=1:n
        PH123y(i,j)=JPH1(i,j)/T1;
    end
end

%PH123JC=PH123y;

 figure,imshow(mat2gray(PH123y));
 
 %%%%%%%%%%%%%%%%%%%%
 phf=-(PH123JC-PH123y);
%  for i=1:m
%      for j=1:n
%          if phf(i,j)>0.6||phf(i,j)<0.25
%              phf(i,j)=0.25;
%          end
%      end
%  end
 phf=medfilt2(phf,[5,5]);
phf=medfilt2(phf,[5,5]);
figure,mesh(phf);

camlight;
lighting phong;
 
%  figure,imshow(mat2gray(JPH2));
%  figure,imshow(mat2gray(JPH3));

%figure,imshow(mat2gray(PH123));
% figure,imshow(mat2gray(JPH46));
% figure,imshow(mat2gray(k4));
% figure,imshow(mat2gray(PH4));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% masky=zeros(m,n);
% am=imread('G:\328\m\1.bmp');
% for i=1:m
%     for j=1:n
%         if am(i,j)>30
%             masky(i,j)=1;
%         end
%     end
% end
% imshow(masky);
% JPH1y=zeros(m,n);
% for i=1:m
%     for j=1:n
%         JPH1y(i,j)=JPH1(i,j)*masky(i,j);
%     end
% end

% figure,imshow(mat2gray(k1));
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
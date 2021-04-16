[m,n]=size(PH1);
kk=40;

% PH1k=PH1(m/2:m/2+kk,:);
% PH2k=PH2(m/2:m/2+kk,:);
% PH3k=PH3(m/2:m/2+kk,:);

% PH1k=PH1(1:kk,:);
% PH2k=PH2(1:kk,:);
% PH3k=PH3(1:kk,:);

PH1k=PH1;
PH2k=PH2;
PH3k=PH3;

[m,n]=size(PH1k);

% a1=PH1k+pi;
% a2=PH2k+pi;
% a3=PH3k+pi;

a1=PH1k;
a2=PH2k;
a3=PH3k;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pha=zeros(m,n);
map=zeros(m,n);
N1=72;N2=63;N3=56;
C=zeros(1,9);
ru=[n/N1;n/N2];
ru1=14;ru2=16;ru3=18;
%ru1=[N1/n;N2/n];
P=zeros(2,1);
km=zeros(m,n);
K=zeros(m,n);
C=im2double(C);

%n=1008;
par=((1/14)^2+(1/16)^2+(1/18)^2)^(-1);
t=1;
Cq=ones(72,1);
tic
for i=1:m
    for j=1:n
        
        yd=round((j/623)*53+1);
        yu=yd+10;
%       

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         yd=round((j/623)*53-1);
%         yu=yd+10;
%         
%         if k1<1
%             k1=1;
%         end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        for k1=yd:yu
            t=1;
             tt2=round(k1*0.875);
             tt3=round(k1*0.78);
             for k2=tt2-1:tt2+1
                 for k3=tt3-1:tt3+1
                    fai1=a1(i,j)+2*pi*k1;
                    fai2=a2(i,j)+2*pi*k2;
                    fai3=a3(i,j)+2*pi*k3;
                    t0=par*(fai1/ru1+fai2/ru2+fai3/ru3);
                    P1=t0/14;P2=t0/16;P3=t0/18;
                    D=(P1-fai1)^2+(P2-fai2)^2+(P3-fai3)^2;
                    C(1,t)=D;
                    t=t+1;
                 end
                end
                [mw,nw]=min(C);
                Cq(k1,1)=mw;
        end
        [me,ne]=min(Cq);
        K(i,j)=ne-1;
        pha(i,j)=a1(i,j)+2*pi*(ne-1);
        map(i,j)=me;
        Cq=ones(72,1);
    end
end
toc

%phat=pha;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure,imshow(mat2gray(a2));
% 
pha=pha.*mask0;
map=map.*mask0;

 figure,imshow(mat2gray(pha));
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 map=mat2gray(map);
 mapc=zeros(m,n,3);
 mapc(:,:,1)=map.*9;
  mapc(:,:,2)=map.*3;
   mapc(:,:,3)=map.*1;
 figure,imshow(mapc);
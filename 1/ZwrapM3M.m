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
K1=zeros(m,n);
K2=zeros(m,n);
K3=zeros(m,n);
C=im2double(C);

%n=1008;
par=((1/14)^2+(1/16)^2+(1/18)^2)^(-1);
t=1;
Cq=ones(72,1);
ck2=zeros(1,3);
ck3=zeros(1,3);
cqk2=ones(72,1);
cqk3=ones(72,1);

tic
for i=1:m
    for j=1:n
        
        yd=round((j/623)*53-1);
        yu=yd+10;
        

           
            
        for k1=yd:yu
        
        if k1<1
            k1=1;
        end
           
                
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
                    ck2(1,t)=k2;
                    ck3(1,t)=k3;
                    t=t+1;
                 end
                end
                [mw,nw]=min(C);
                Cq(k1,1)=mw;
                cqk2(k1,1)=ck2(1,nw);
                cqk3(k1,1)=ck3(1,nw);
        end
        [me,ne]=min(Cq);
        K1(i,j)=ne-1;
        kk2=cqk2(ne);
        K2(i,j)=kk2;
        kk3=cqk3(ne);
        K3(i,j)=kk3;
        pha(i,j)=a1(i,j)+2*pi*(ne-1);
        pha2(i,j)=a2(i,j)+2*pi*(kk2-1);
        pha3(i,j)=a3(i,j)+2*pi*(kk3-1);
        map(i,j)=me;
        Cq=ones(72,1);
    end
end
toc


%phat=pha;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure,imshow(mat2gray(a2));
% 
%pha=pha.*mask0;

 figure,imshow(mat2gray(pha));
 
%  figure,imshow(mat2gray(pha2));
%  figure,imshow(mat2gray(pha3));
 
 pha2=pha2.*(72/63);
 pha3=pha3.*(72/56);
 pha=(pha+pha2+pha3)./3;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 map=mat2gray(map);
 mapc=zeros(m,n,3);
 mapc(:,:,1)=map.*9;
  mapc(:,:,2)=map.*3;
   mapc(:,:,3)=map.*1;
 figure,imshow(mapc);
 
%  maskm=ones(m,n);
%  maskm(map>0.08)=0;
%   figure,imshow(maskm);
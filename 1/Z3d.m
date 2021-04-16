

% pha0=pha;
% 
%  save pbw pha0;

pha0=cell2mat(struct2cell((load('pbc.mat'))));
%pha0=pha0-40;

phf=(pha-pha0);

phf0=phf;

%  phf0=phf0.*mask0;

%%%%%%%%%%%%%%%%%%%%
for i=350:500
    for j=1:170
        M0(i,j)=1;
    end
end
%%%%%%%%%%%%%%%%%%%%


  phf0=phf0.*M0;

  %imshow(M0);
 
    %phf0=medfilt2(phf0,[3,3]);
    
      phf0=medfilt2(phf0,[5,5]);
    %  phf0=medfilt2(phf0,[5,5]);
      
%      phf=medfilt2(phf,[5,5]);
%      phf=medfilt2(phf,[5,5]);
%      phf=medfilt2(phf,[5,5]);
     
      phf0(phf0>34)=0;
      phf0(phf0<-1)=0;
      
      phf0(1,2)=34;
      phf0(1,1)=-1;
      
 phf0=phf0.*7.6/1.48;%3.95

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%¶Ô³Æ
[m,n]=size(phf0);
phfjc=zeros(m,n);
for i=1:m
    for j=1:n
        phfjc(i,j)=phf0(m-i+1,j);
    end
end
phf0=phfjc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phf0(phf0==0)=NaN;



 figure,mesh(phf0);
 
%  camlight;
% lighting phong;


shading interp
 light('position',[0.3,1,0.3],'style','infinite')
 %%%%%%%%%%

 lighting phong
 

 
 %0.3 0.8 0.5


% save pha0k pha0;
% save phamk pha;


%figure,warp(phf,col);
xlabel('X (Pixel)');
ylabel('Y (Pixel)');
zlabel('Z (mm)');

 %axis([1 689 1 564]);
% 
c=colorbar;
set(get(c,'label'),'string','Height (mm)')
% 
 set(gca,'FontSize',13);
% 
     set(gcf,'unit','normalized','position',[0.3,0.3,0.345,0.42]);
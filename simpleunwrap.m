[m,n]=size(wrapped_Phase);
kk=jwrapped_Phase;
kkk=zeros(m,n);
for i=1:m
    for j=2:n
        if -(kk(i,j)-kk(i,j-1))>pi 
            kkk(i,j)=1+kkk(i,j-1);
        else
            kkk(i,j)=kkk(i,j-1);
        end
    end
end
%mesh(kkk);
for i=1:m
    for j=1:n
        ff(i,j)=kkk(i,j)*2*pi+kk(i,j);
    end
end
jcff=ff;
kkk0=kkk;
%figure,mesh(ff);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kk=wrapped_Phase;
for i=1:m
    for j=2:n
        if -(kk(i,j)-kk(i,j-1))>pi
            kkk(i,j)=1+kkk(i,j-1);
        else
            kkk(i,j)=kkk(i,j-1);
        end
    end
end
%mesh(kkk);
for i=1:m
    for j=1:n
        ff(i,j)=kkk(i,j)*2*pi+kk(i,j);
    end
end
fp=-ff+jcff;
fp=medfilt2(fp,[5,5]);
fp=medfilt2(fp,[5,5]);
figure,mesh(fp);
camlight;
lighting phong;
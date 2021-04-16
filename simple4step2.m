

i1=imread('H:\物体1\平面\17.bmp');
i2=imread('H:\物体1\平面\18.bmp');
i3=imread('H:\物体1\平面\19.bmp');
i4=imread('H:\物体1\平面\20.bmp');


I1=mat2gray(i1);
I2=mat2gray(i2);
I3=mat2gray(i3);
I4=mat2gray(i4);

[m,n]=size(I1);
i0=zeros(m,n);


for x=1:m
    for y=1:n
        a(x,y)=atan2(I2(x,y)-I4(x,y),I1(x,y)-I3(x,y));
    end
end

u=zeros(m,n);
for x=1:m
    for y=2:n
        if abs(a(x,y)-a(x,y-1))<pi
            u(x,y)=u(x,y-1);
       elseif a(x,y)-a(x,y-1)<pi
            u(x,y)=u(x,y-1)+1;
        elseif a(x,y)-a(x,y-1)>pi
            u(x,y)=u(x,y-1)-1;
        end
    end
end
u=u.*2*pi;
a1=u+a; 
imshow(mat2gray(a));
figure,imshow(mat2gray(a1));

af=a1-a1j;
figure,mesh(af);
camlight;
lighting phong;
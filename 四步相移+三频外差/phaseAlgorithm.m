function [objPH] =phaseAlgorithm(dircell,dt,T1,T2,T3)

C = cell(3,4);

for s=1:12
    I =imread(dircell{s});
    I = I(:,:,dt);
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

[height,width] = size(I);

% 求取相位差
% 计算每种频率对应的相位主值
% 输出三种频率的相位主值，用于相差计算
phi = cell(3,1);
for i = 1:3
    phi{i,1} = zeros(height,width);
end

for i = 1:3;
    I1 = double (C{i,1});
    I2 = double(C{i,2});
    I3 = double(C{i,3});
    I4 = double(C{i,4});
    
    for g = 1:height
        for k =1:width
             if I4(g,k)==I2(g,k)&&I1(g,k)>I3(g,k) %四个特殊位置
                    phi{i,1}(g,k)=0;
            elseif I4(g,k)==I2(g,k)&&I1(g,k)<I3(g,k) %四个特殊位置
                    phi{i,1}(g,k)=pi; 
            elseif I1(g,k)==I3(g,k)&&I4(g,k)>I2(g,k) %四个特殊位置
                    phi{i,1}(g,k)=pi/2;
            elseif I1(g,k)==I3(g,k)&&I4(g,k)<I2(g,k) %四个特殊位置
                    phi{i,1}(g,k)=3*pi/2;
            elseif I1(g,k)<I3(g,k) %二三象限
                    phi{i,1}(g,k)=atan((I4(g,k)-I2(g,k))./(I1(g,k)-I3(g,k)))+pi;
            elseif I1(g,k)>I3(g,k)&&I4(g,k)>I2(g,k) %第一象限
                    phi{i,1}(g,k)=atan((I4(g,k)-I2(g,k))./(I1(g,k)-I3(g,k)));
            elseif I1(g,k)>I3(g,k)&&I4(g,k)<I2(g,k) %第四象限
                    phi{i,1}(g,k)=atan((I4(g,k)-I2(g,k))./(I1(g,k)-I3(g,k)))+2*pi;  
             end
        end
    end
end

  
% 计算相差
% 保存矩阵，用于多频相差的计算
PH1 = phi{1,1};
PH2 = phi{2,1};
PH3 = phi{3,1};

% 初始化相差变量
% 多频相差
PH13 = zeros(height,width);
PH23 = zeros(height,width);
PH123 = zeros(height,width);

% 计算相差
% 相差计算
% 解相
for g =1:height
    for k =1:width
            % 计算第一组和第二组的相差
       if PH1(g,k) > PH3(g,k)
           PH13(g,k) = PH1(g,k) - PH3(g,k);
       else
           PH13(g,k) = PH1(g,k)+2*pi - PH3(g,k);
       end
       if PH2(g,k) > PH3(g,k)
           PH23(g,k) = PH2(g,k) - PH3(g,k);
       else
           PH23(g,k) = PH2(g,k)+2*pi - PH3(g,k);
       end
         
    end
end

% 计算最终相差
% 相差图案
% 相位解包裹
for g = 1:height
	for k = 1:width
		if PH13(g,k)>PH23(g,k)
			PH123(g,k) = PH13(g,k)-PH23(g,k);
		else
			PH123(g,k) = PH13(g,k)+2*pi-PH23(g,k);
		end
	end
end

% 显示
figure,imshow(mat2gray(PH1));title('1相位主值');  
% figure,imshow(mat2gray(PH2));title('2相位主值'); 
% figure,imshow(mat2gray(PH3));title('3相位主值');
% figure,imshow(mat2gray(PH13));title('1,3外差');  
% figure,imshow(mat2gray(PH23));title('2,3外差'); 
%figure,imshow(mat2gray(PH123));title('1,2,3外差');


T13=T1-T3;
T23=T2-T3;
T123=1;

k13=round(((T13/T123).*PH123-PH13)./(2*pi));      % 相位1,3的外差相位PH13的条纹级次
JPH13=PH13+k13.*(2*pi);                           % JPH13是PH13的连续相位

k23=round(((T23/T123).*PH123-PH23)./(2*pi));      % 相位2,3的外差相位PH23的条纹级次
JPH23=PH23+k23.*(2*pi);                           % JPH23是PH23的连续相位

k1=round(((T1/T13).*JPH13-PH1)./(2*pi));% 截断相位PH1的条纹级次
JPH1=PH1+k1.*(2*pi);    % JPH1为截断相位PH1的连续相位

objPH=zeros(height,width);
for i=1:height
    for j=1:width
        objPH(i,j)=JPH1(i,j)/T1;
    end
end
figure,imshow(mat2gray(objPH));
end
 
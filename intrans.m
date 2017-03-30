function [ ghe ] = intrans( data )
%对比度拉伸增强骨骼结构
tempData = rgb2gray(data);
% [~,~,k] = size(data);
% for i = 1:k
%     tempData = double(data(:,:,i));
%     maxValue = max(max(tempData));
%     minValue = min(min(tempData));
%     tempData = (tempData-minValue)/(maxValue-minValue);
%     targetData(:,:,i) = tempData;
% end
% imshow(targetData,[0,255]);

% low_in = double(min(tempData(:)))./255;
% high_in = double(max(tempData(:)))./255;
% targetData = imadjust(tempData,[0,0.4],[0,1]);
% figure();
% imshow(targetData);
% imwrite(targetData,'.\results\6-1.png','png');


PQ = size(tempData);
D0 = 0.05*PQ(1);
% HBW = lpfilter('btw', PQ(1), PQ(2), D0, 2); %书上的代码...实际巴特沃斯高通滤波器需要自行编写
%巴特沃斯高通滤波器
[U, V] = dftuv( PQ(1), PQ(2));
D = hypot(U, V);
HBW = 1 - 1./(1+(D./D0).^(2*PQ(2)));
H = 0.5+0.01*HBW;
gbw = dftfilt(tempData, HBW, 'fltpoint');
gbw = gscale(gbw);
ghf = dftfilt(tempData, H, 'fltpoint');
ghf = gscale(ghf);
ghe = histeq(ghf, 256);
imshow(ghe);
imwrite(ghe, '.\results\6-2.png', 'png');
end


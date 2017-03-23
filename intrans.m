function [ targetData ] = intrans( data )
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
low_in = double(min(tempData(:)))./255;
high_in = double(max(tempData(:)))./255;
targetData = imadjust(tempData,[0,0.3],[0,1]);
figure();
imshow(targetData);
imwrite(targetData,'.\results\6.png','png');
    
end


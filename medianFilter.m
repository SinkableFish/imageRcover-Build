function [ output_args ] = medianFilter( data )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
figure();
tempData = ordfilt2(data(:,:,1),5,ones(3,3));%中值滤波去噪。
imshow(tempData);
imwrite(tempData,'.\results\3.png','png');

end


function [ output_args ] = gaussianNoise( data )
%ศฅณýธ฿หนิ๋ษ๙
data = rgb2gray(data);
tempData = ordfilt2(data, 1, ones(3,3));
binData = im2bw(tempData);
% linkMatrix = bwlabel(binData, 8);
cutData = uint8(double(data)+binData*255);
imshow(cutData, [0,255]);
imwrite(cutData, '.\results\2.png', 'png');
end


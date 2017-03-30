function [  ] = darkChannel( data )
%暗通道去雾,因为是一幅灰度图像，三个通道的值相同,所以在A处进行降维处理，只对一个通道进行计算
w = 0.95;
[m,n,~] = size(data);
darkImage = zeros(m,n);
tempData(:,:,1) = ordfilt2(data(:,:,1),1,ones(9,9));
tempData(:,:,2) = ordfilt2(data(:,:,2),1,ones(9,9));
tempData(:,:,3) = ordfilt2(data(:,:,3),1,ones(9,9));
for i = 1:m
    for j = 1:n
        darkImage(i,j) = min(tempData(i,j,:));
    end
end
imwrite(uint8(darkImage),'.\results\4-1.png', 'png');
[m,n] = size(darkImage);
N = floor(m*n/1000);
maxGrayValue = max(max(darkImage));
while (maxGrayValue>1)
    [x, y] = find(darkImage > maxGrayValue-1);
    maxGrayValue = maxGrayValue-1;
    if (length(x) >= N)
        brightLocation = [x, y];
        break;
    end
end
ArSum=0;AgSum=0;AbSum=0;
for i=1:N
    ArSum = double(data(brightLocation(i,1),brightLocation(i,2),1)) + ArSum;
    AgSum = double(data(brightLocation(i,1),brightLocation(i,2),2)) + AgSum;
    AbSum = double(data(brightLocation(i,1),brightLocation(i,2),3)) + AbSum;
end
Ar = ArSum/N;
Ag = AgSum/N;
Ab = AbSum/N;
A = [Ar Ag Ab];
temp = double(data(:,:,1));
tx = 1-w*min(min(temp/A(1)));
finalImage = (temp-A(1))/max(tx, 0)+A(1);
finalImage = uint8(finalImage);
imshow(finalImage);
imwrite(finalImage,'.\results\4.png','png')
end


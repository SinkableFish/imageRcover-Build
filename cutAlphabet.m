function [ output_args ] = cutAlphabet( data )
%分割车牌
MN=[8 110];
SE = strel('line', 10, 90);
SE2 = strel('rectangle',MN);
test = imerode(data, SE);
imwrite(test, '.\results\1-a.png', 'png');
test = imdilate(test, SE2);
imwrite(test, '.\results\1-b.png', 'png');
test(test<210) = 0;
test = im2bw(test);
imwrite(test, '.\results\1-c.png', 'png');
linkMatrix = bwlabel(test, 8);
countNum = 1:max(max(linkMatrix));
tempCount = histc(bwlabel(test,8), countNum);
count = sum(tempCount, 2);
[maxNum, maxIndex] = max(count);
% imshow(bwlabel(test,8));
linkMatrix(linkMatrix ~= maxIndex) = 0;
linkMatrix(linkMatrix == maxIndex) = 1;
binTest1 = im2bw(data);
finalData = binTest1&linkMatrix;
% finalData = imdilate(finalData,SE3);
% imshow(finalData); 
% imwrite(finalData, '.\results\1.png', 'png');
%至此，车牌区域提取完成

%字符分割开始
linkMatrix2 = bwlabel(finalData, 8);
maxValue = max(max(linkMatrix2));
for i=1:maxValue
    [m, n] = find(linkMatrix2==i);
    m = m+2-min(m);
    n = n+2-min(n);
    cutAlpha = zeros(max(m),max(n));
    for j=1:length(m)
        cutAlpha(m(j), n(j)) = 255;
    end
    figure();
    imshow(cutAlpha);
    F=getframe;
    imwrite(F.cdata,'.\results\1-6.jpg');
end
end


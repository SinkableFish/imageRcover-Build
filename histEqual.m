function [ output_args ] = histEqual( data )
%Ö±·½Í¼¾ùÔÈ
tempData = rgb2gray(data);
figure();
imhist(tempData,256);
saveas(gcf,'.\results\5-1.png')
g = histeq(tempData,256);
figure();
imhist(g,256);
saveas(gcf,'.\results\5-2.png')
figure();
imshow(g);
imwrite(g,'.\results\5.png','png')

end


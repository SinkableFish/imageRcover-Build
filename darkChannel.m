function [ darkImage ] = darkChannel( data )
%°µÍ¨µÀ
[m,n,k] = size(data);
darkImage = zeros(m,n);
% tempData = zeros(m,n);
for i = 1:m
    for j = 1:n
        darkImage(i,j) = min(data(i,j,:));
    end
end
tempData = ordfilt2(darkImage,1,ones(20,20));
% imshow(darkImage,[0,255]);
% figure(2);
imshow(tempData,[0,255]);

end


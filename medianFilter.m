function [ output_args ] = medianFilter( data )
%中值滤波降噪
figure();
tempData = ordfilt2(data(:,:,1),5,ones(3,3));%中值滤波去噪。
imshow(tempData);
imwrite(tempData,'.\results\3.png','png');

end


function [ output_args ] = medianFilter( data )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
figure();
tempData = ordfilt2(data(:,:,1),5,ones(3,3));%��ֵ�˲�ȥ�롣
imshow(tempData);
imwrite(tempData,'.\results\3.png','png');

end


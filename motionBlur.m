function [  ] = motionBlur( data )
% tempData=rgb2gray(data);
% PQ=size(tempData);
% F = fft2(tempData, PQ(1), PQ(2));
% data = rgb2gray(data);
PSF = fspecial('motion',80,0);
tempRecover = imfilter(data,PSF,'circular','conv');
figure();
imshow(tempRecover);
tempRecover = deconvlucy(tempRecover,PSF,3);
% tempRecover = deconvwnr(tempRecover, PSF);
figure();
imshow(tempRecover, []);
end


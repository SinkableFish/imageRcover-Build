function [  ] = motionBlur( data )
%¶¯Ì¬Ä£ºý¸´Ô­
PSF = fspecial('motion',8,0);
tempRecover = deconvwnr(data, PSF, 0.02);
imshow(tempRecover);
imwrite(tempRecover, '.\results\7.png', 'png');
end


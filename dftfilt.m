function g = dftfilt(f, H, classout)
%处理浮点型&滤波后转入与原始图像相同类别
[f, revertclass] = tofloat(f);
F = fft2(f, size(H, 1), size(H, 2));
g = real(ifft2(H.*F));
g = g(1:size(f, 1), 1:size(f, 2));
if nargin == 2 || strcmp(classout, 'original');
    g = revertclass(g);
elseif strcmp(classout, 'fltpoint')
    return
else
    error('未定义输出图像的格式');
end

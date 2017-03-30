function g = dftfilt(f, H, classout)
%��������&�˲���ת����ԭʼͼ����ͬ���
[f, revertclass] = tofloat(f);
F = fft2(f, size(H, 1), size(H, 2));
g = real(ifft2(H.*F));
g = g(1:size(f, 1), 1:size(f, 2));
if nargin == 2 || strcmp(classout, 'original');
    g = revertclass(g);
elseif strcmp(classout, 'fltpoint')
    return
else
    error('δ�������ͼ��ĸ�ʽ');
end

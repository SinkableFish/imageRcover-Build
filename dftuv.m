function [ V, U ] = dftuv( M,N )
%DFTUV ʵ��Ƶ���˲�����������  
u = single(0:(M - 1));  
v = single(0:(N - 1));  
idx = find(u > M/2); %�Ҵ���M/2������  
u(idx) = u(idx) - M; %������M/2�����ݼ�ȥM  
idy = find(v > N/2);  
v(idy) = v(idy) - N;  
[V, U] = meshgrid(v, u);       
end


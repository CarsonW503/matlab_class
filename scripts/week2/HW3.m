%% multGauss
% a = height of bell curve
% b = position of the center of the peak
% c = standard dev (width)
% function multGauss should input a 3 column matrix with vector x
% 3 columns should be the amplitude, width, and location
% rows should be parameters for each gaussian profile
% multGuass should return the sum of the profiles
% y1(x) y2(x) y3(x)
% output = y1 + y2 + y3

clc
clear

A = [0.1, 0.5, 2; 0.5, 1, 4; 1, 1, 6; 2, 3, 8];
x = [0:0.1:20];

[Nr, Nc] = size(A);

if Nc == 4
    disp('The Matrix Has 3 Columns')
else
    disp('Error')
end

for i = 1:Nr
multGauss(i,:) = A(i,1)*gaussmf(x, [A(i,2), A(i,3)]);
% plot(x,multGauss(i,:)), hold on;
end

sumplot = sum(multGauss);
plot(x, sumplot)
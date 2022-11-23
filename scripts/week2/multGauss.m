function out = multGauss(x, A)


[Nr, Nc] = size(A);


if Nc == 3
    disp('The Matrix Has 3 Columns')
else
    disp('Error - Matrix Must Have 3 Columns')
    return
end


for i = 1:Nr
output(i,:) = A(i,1)*gaussmf(x, [A(i,2), A(i,3)]);
end


out = sum(output);

%Need to be able to compute arbitrary number of rows...
%error check the Nc...
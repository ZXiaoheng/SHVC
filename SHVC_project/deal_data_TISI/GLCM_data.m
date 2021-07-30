% 这里是在处理灰度共生矩阵的数据
% 好像没有处理的步骤。。。

clear all
path='result_16.txt'
data=dlmread(path)

for k=1:6
    k
    data(:,k)
end
size(data)
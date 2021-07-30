% 这部分代码是在处理SI和TI的数据，求平均值，最后的结果存在a矩阵里
% 把TI和SI的数据放到TI和SI对应的文件夹下就可以
clear all
 Path_01 = 'E:\matlab_code\deal_data_TISI\TI\';                   % 设置数据存放的文件夹路径
 File = dir(fullfile(Path_01,'*.ti'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}           % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
len = size(FileNames,2)
result=ones(2,19)
data=ones(249,19);
data02=ones(250,19)
for k=1:len
    path_pic = strcat(Path_01, FileNames(k))
    data(:,k)=textread(path_pic{1,1},'%.4f');
    
    result(1,k)=mean(data(:,k));
%     I=imread(path_pic{1,1});
end

Path_02 = 'E:\matlab_code\deal_data_TISI\SI\';                   % 设置数据存放的文件夹路径
File = dir(fullfile(Path_02,'*.si'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}           % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
len = size(FileNames,2)

for k=1:len
    path_pic = strcat(Path_02, FileNames(k))
    data02(:,k)=textread(path_pic{1,1},'%.4f');
    
    result(2,k)=mean(data02(:,k));
%     I=imread(path_pic{1,1});
end
data02
a=result'
a(:,1)
a(:,2)

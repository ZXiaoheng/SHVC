% �ⲿ�ִ������ڴ���SI��TI�����ݣ���ƽ��ֵ�����Ľ������a������
% ��TI��SI�����ݷŵ�TI��SI��Ӧ���ļ����¾Ϳ���
clear all
 Path_01 = 'E:\matlab_code\deal_data_TISI\TI\';                   % �������ݴ�ŵ��ļ���·��
 File = dir(fullfile(Path_01,'*.ti'));  % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.txt�ļ���������Ϣ
FileNames = {File.name}           % ��ȡ���Ϻ�׺��Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��
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

Path_02 = 'E:\matlab_code\deal_data_TISI\SI\';                   % �������ݴ�ŵ��ļ���·��
File = dir(fullfile(Path_02,'*.si'));  % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.txt�ļ���������Ϣ
FileNames = {File.name}           % ��ȡ���Ϻ�׺��Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��
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

clear all
clc
format long g  %���ÿ�ѧ������
a=textread('data.txt');
% a(:,[4,6,7])=[]

a=a(:,[1,2,3])
[R,P]=corrcoef(a)
R=roundn(R,-4)
P=roundn(P,-4)
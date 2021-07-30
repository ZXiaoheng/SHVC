clear all
clc
format long g  %不用科学计数法
a=textread('data.txt');
% a(:,[4,6,7])=[]

a=a(:,[1,2,3])
[R,P]=corrcoef(a)
R=roundn(R,-4)
P=roundn(P,-4)
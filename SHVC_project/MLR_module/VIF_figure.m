%VIF迭代图

clear all
vif_data=[58.07	27.95	20.72	9.67 4.05]
plot(vif_data,'r-o','LineWidth',2)
x=1:5
grid on
box off  
%set(gca,'gridlinestyle',':');
set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
xticks(1:1:5) %设置X轴的刻度
xlabel('Iterations');ylabel('VIF_{max}')
%str=[repmat('  X:',5,1) num2str(x') repmat(', Y:',5,1) num2str(y')];
str=[repmat('  ',5,1) num2str(vif_data')];
text(x,vif_data,cellstr(str))


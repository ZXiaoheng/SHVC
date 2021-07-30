%²âÊÔÑù±¾Í¼
clear all
real_norm=[-0.00227666484887584;-0.930091044703169;1.99481967954747;-0.496437793086566]
pre_norm=[-0.0779802879596221;-0.937173982518745;1.71876163338482;-0.420142644176680]
figure
plot([real_norm,pre_norm],'-o','LineWidth',2)
box off  
grid on
%set(gca,'gridlinestyle',':');
set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
%xlabel('true value ');ylabel('predicted value')
h1=legend('true value ','predicted value')
set(h1,'box','off')
axis([0.5 4.5 -1.5 2.5])
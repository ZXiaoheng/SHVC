%����ѵ������ɢ��ͼ

datax=[175.509
175.509
175.509
175.509
186.938
186.938
186.938
186.938
186.938
309.36
309.36
648.414
648.414
648.414
]
datay=[91.17982544
132.4835141
121.2274107
114.4729205
157.8399853
152.3328397
159.9273516
173.7792514
176.6284509
185.6314836
195.6958222
734.6391604
738.0183667
740.2402894
]

plot(datax,datay,'bx','LineWidth',1)%ɢ��ͼ
hold on

x=30:750
y=x


plot(x,y,'r','LineWidth',2) %ֱ��
box off   %ȥ�����Ͻ������߿�
grid on  %������
%set(gca,'gridlinestyle',':');
set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1); %���ó���������
xlabel('Real bitrate(kbps)');ylabel('Eestimated bitrate(kbps)');
axis([0 800 0 800])




from statsmodels.stats.outliers_influence import variance_inflation_factor
import numpy as np

#设置保留的小数位数、关闭科学计数法
np.set_printoptions(suppress=True)
np.set_printoptions(precision=4)

data=np.loadtxt('data.txt')
data = data[:, 1:] #提取数据
a = np.ones(19).T
max_np=np.ones(10)
max_vif=20.0
die=0
while(max_vif>9):

    data_deal=np.insert(data,data.shape[1],values=a, axis=1)# 需要在数据中插入一个常数项维度，否则函数计算会出错

    print(data.shape[1])

    VIF_list = [variance_inflation_factor(data_deal,i) for i in range(data.shape[1])] #计算VIF值

    VIF_list=VIF_list[0:data.shape[1]]
    VIF_list = [round(i,2) for i in VIF_list]
    max_vif=max(VIF_list) #保存VIF的最大值
    #剔除VIF最大值对应的变量
    if(max_vif>9):
        max_np[die] = max_vif
        max_index = VIF_list.index(max(VIF_list))
        data=np.delete(data,max_index,1)
        die+=1
    print('迭代',die,max_vif)

print(max_np)
print(VIF_list)
print(data)
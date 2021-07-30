# ================基于Scikit-learn接口的回归================
import xgboost as xgb
import numpy as np
from xgboost import plot_importance
from matplotlib import pyplot as plt
#from xgboost import compute_loss
from sklearn.model_selection import train_test_split
from sklearn.datasets import load_boston

np.set_printoptions(suppress=True)
np.set_printoptions(precision=4)

params = {
    'booster': 'gbtree',
    'objective': 'reg:gamma',
    'gamma': 0.001,
    'max_depth': 40,
    'lambda': 50,
    'subsample': 1,
    'colsample_bytree': 1,
    'min_child_weight': 0.001,
    'silent': 1,
    'eta': 0.01,
    'seed': 1000,
    'nthread': 2,
}

#boston = load_boston()
#X, y = boston.data, boston.target
data=np.loadtxt('data.txt')
#data[:,6:7]=data[:,6:7]*100
#data[:,1]=data[:,1]*100
#data[:,[2,5]]=data[:,[2,5]]*10

#boston = load_boston()
#X, y = boston.data, boston.target
X=data[:,1:]
y=np.sqrt(data[:,0])
#y=np.log10(data[:,0])*100

print(X,'\n',y)

# XGBoost训练过程
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=11)

dtrain = xgb.DMatrix(X, y)
dtest = xgb.DMatrix(X_test)

cv_res = xgb.cv(params, dtrain, num_boost_round=50000, early_stopping_rounds=30000, nfold=5, show_stdv=True, metrics='rmse')
print('这里',cv_res)

print('这里',dtest)

# cv_res.shape[0]为最佳迭代次数
bst = xgb.train(params, dtrain, num_boost_round=10000)

pred_Y = bst.predict(dtest)
pred_Y*=pred_Y
y_test*=y_test
print(pred_Y)
#pred_Y=10**(pred_Y/100)
#y_test=10**(y_test/100)
print(y_test)

print((pred_Y-y_test)/y_test*100)

plt.figure() # 作损失函数的图

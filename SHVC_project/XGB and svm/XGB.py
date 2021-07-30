# ================基于Scikit-learn接口的回归================
import xgboost as xgb
from xgboost import plot_importance
from matplotlib import pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.datasets import load_boston
import numpy as np
np.set_printoptions(suppress=True)

np.set_printoptions(precision=4)
data=np.loadtxt('data.txt')

#boston = load_boston()
#X, y = boston.data, boston.target
X=data[:,1:]
y=data[:,0]
#y=np.log10(data[:,0])

print(X,y)

# XGBoost训练过程
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=13)
print('y_test',y_test)
model = xgb.XGBRegressor(max_depth=8, learning_rate=0.01, n_estimators=36000, silent=True, objective='reg:gamma')
model.fit(X_train, y_train)

# 对测试集进行预测
ans = model.predict(X_test)
print(y_test)
print(ans)
print((y_test-ans)/y_test*100)
# 显示重要特征
plot_importance(model)

#plt.show()
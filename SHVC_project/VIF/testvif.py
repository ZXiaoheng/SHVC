import pandas as pd
import numpy as np
from statsmodels.stats.outliers_influence import variance_inflation_factor

# 宽表
data = pd.DataFrame([[15.9, 16.4, 19, 19.1, 18.8, 20.4, 22.7, 26.5, 28.1, 27.6, 26.3]
                        , [149.3, 161.2, 171.5, 175.5, 180.8, 190.7, 202.1, 212.1, 226.1, 231.9, 239]
                        , [4.2, 4.1, 3.1, 3.1, 1.1, 2.2, 2.1, 5.6, 5, 5.1, 0.7]
                        , [108.1, 114.8, 123.2, 126.9, 132.1, 137.7, 146, 154.1, 162.3, 164.3, 167.6]]).T

# 自变量
X = data[[1, 2, 3]]

# ✨✨✨务必注意✨✨✨，一定要加上常数项
X[4] = 1

# 计算第2个变量的(第二列)的方差膨胀因子
result=variance_inflation_factor(X[[1, 2, 3, 4]].values, 1)
print(X)
print(result)

# 如果没有常数项列，计算结果天差地别，可能VIF等于好几千
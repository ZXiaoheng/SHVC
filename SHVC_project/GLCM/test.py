import numpy as np

data=np.random.rand(6,10)
fp1=open("TEST.txt",'a')
fp1.write("THIS is one run : \n\nmodulo's mean : \n"+ "  ".join(map(str, data)))
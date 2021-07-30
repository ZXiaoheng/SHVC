"""
提取glcm纹理特征
"""
import numpy as np
import cv2
import os
import pandas as pd
import matplotlib.pyplot as plt
from skimage.feature import greycomatrix, greycoprops

path="D:\cctv_png\\"
#path="D:/test//"

np.set_printoptions(suppress=True)

np.set_printoptions(precision=4)



def get_inputs(s):  # s为图像路径


    filelist_01 = os.listdir(path)
    temp_allvedio=np.random.rand(6,len(filelist_01))
    for file_num in range(len(filelist_01)):
        filelist = os.listdir(path+filelist_01[file_num])
        temp_mean = np.random.rand(6,len(filelist))

        for i in range(len(filelist)):
            input = cv2.imread(path+filelist_01[file_num]+'\\'+filelist[i], cv2.IMREAD_GRAYSCALE)  # 读取图像，灰度模式

            # 得到共生矩阵，参数：图像矩阵，距离，方向，灰度级别，是否对称，是否标准化
            glcm = greycomatrix(
                input, [
                    16, 8, 16], [
                    0, np.pi / 4, np.pi / 2, np.pi * 3 / 4], 256, symmetric=True, normed=True)

            #print(glcm)
            #print("循环次数",i)
            # 得到共生矩阵统计值，http://tonysyu.github.io/scikit-image/api/skimage.feature.html#skimage.feature.greycoprops
            prop=['contrast', 'dissimilarity',
                         'homogeneity', 'energy', 'correlation', 'ASM']
            #print(prop)
            # for prop in {'contrast', 'dissimilarity',
            #              'homogeneity', 'energy', 'correlation', 'ASM'}:
            #     temp = greycoprops(glcm, prop)
            #     # temp=np.array(temp).reshape(-1)
            #     print(prop, temp)

            # plt.imshow(input,cmap="gray")
            # plt.show()
            for s_L in range(6):
                temp = greycoprops(glcm, prop[s_L])
                temp_mean[s_L,i]=np.mean(temp[0])


        temp_onevedio=np.mean(temp_mean, axis=1)
        print('视频',file_num,temp_onevedio)
        temp_allvedio[:,file_num]=temp_onevedio


    print('最后结构',temp_allvedio)

    temp_allvedioT=temp_allvedio.T
    print('转置',temp_allvedioT)
    temp_allvedioT=np.around(temp_allvedioT,4)
    fp1=open('result_16.txt','w')
    for re_num in range(len(temp_allvedioT[:,1])):
        fp1.write("  ".join(map(str, temp_allvedioT[re_num]))+'\n')

        #temp_result=np.mean(temp_mean[:])



if __name__ == '__main__':
    get_inputs(r"E:\python_code\GLCM\Image\001.png")


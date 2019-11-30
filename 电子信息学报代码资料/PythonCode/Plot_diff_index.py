import numpy as np
from keras.models import load_model
import pandas as pd
import pickle
import matplotlib
import matplotlib.pyplot as plt\

from scipy.io import loadmat

plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['axes.unicode_minus'] = False
myFont = matplotlib.font_manager.FontProperties(fname=r"C:\Windows\Fonts\simsun.ttc",size=7)
myFont_Euclid = matplotlib.font_manager.FontProperties(fname=r"C:\Windows\Fonts\Euclid.ttf",size=7)

def standardize(train):
    mean = np.mean(train,axis=0)
    std = np.std(train,axis=0)+1e-5

    X_train = (train-mean)/std
    return X_train

model = load_model('./Models_DNN_huawei/DNN_RSRP_relu_done_Peking.h5')

MatlabData_DF = pd.read_csv('./Index_18.dat')
index_11 = MatlabData_DF['index_18']
real_RSRP = MatlabData_DF['real_RSRP']
pre_RSRP = MatlabData_DF['pre_RSRP']
print(min(pre_RSRP))
print(max(pre_RSRP))
print(np.mean(pre_RSRP))
f1 = plt.figure()
plt.plot(pre_RSRP,'b-o')
plt.plot(real_RSRP,'r-*')
plt.legend(['COST231-Hata模型预测RSRP','真实测量RSRP'],prop=myFont)
plt.xticks(fontproperties=myFont)
plt.yticks(fontproperties=myFont_Euclid)
plt.xlabel('随机测试点',fontproperties=myFont)
plt.ylabel('测试点平均接收功率RSRP(dBm)',fontproperties=myFont)
plt.grid(linestyle='-.',linewidth=0.5)
f1.savefig('Predict_RSRP_COST231_index18.jpeg', dpi=600)
plt.show()

# filePath = './test_index11.dat'
# data = np.loadtxt(filePath)
data = loadmat('./data_index18.mat')
data = data['data_index18']
data = standardize(data)
y_true = real_RSRP
y_true = np.array(y_true).reshape((-1,1))
predict_results = model.predict(data)
# predict_results = np.array(predict_results).reshape((-1,1))
# np.savetxt('./pre_DNN_18.dat',predict_results)



# y_true = np.loadtxt('./y_test.dat')
# y_true = np.array(y_true).reshape((-1,1))
# predict_results = np.loadtxt('./predictions')
# predict_results = np.array(predict_results).reshape((-1,1))
# print(min(predict_results))
# print(max(predict_results))
# print(np.mean(predict_results))
# print(np.var(predict_results))
# def CaculatePcrr(y_true,y_pred):
#     t = -103
#     tp = len(y_true[(y_true<t)&(y_pred<t)])
#     fp = len(y_true[(y_true >= t) & (y_pred < t)])
#     fn = len(y_true[(y_true < t) & (y_pred >= t)])
#     precision = tp/(tp+fp)
#     recall = tp/(tp+fn)
#     pcrr = 2*(precision*recall)/(precision+recall)
#     return pcrr
#
# pcrr=CaculatePcrr(y_true,predict_results)
# print(pcrr)
f = plt.figure()
plt.plot(predict_results,'b-o')
plt.plot(y_true,'r-*')
plt.legend(['DNN网络预测RSRP','真实测量RSRP'],prop=myFont)
plt.xticks(fontproperties=myFont)
plt.yticks(fontproperties=myFont_Euclid)
plt.xlabel('随机测试点',fontproperties=myFont)
plt.ylabel('测试点平均接收功率RSRP(dBm)',fontproperties=myFont)
plt.grid(linestyle='-.',linewidth=0.5)
f.savefig('Predict_RSRP_DNN_index18.jpeg', dpi=600)
plt.show()
plt.figure(2)
# plt.plot(predict_results,'b-o')
# plt.show()
# RMSE_COST = np.sqrt(sum(np.power(np.abs(real_RSRP)-np.abs(pre_RSRP),2))/len(pre_RSRP))
# RMSE = np.sqrt(sum(np.power(y_true-predict_results,2))/len(y_true))
# print(RMSE_COST)
# print(RMSE)

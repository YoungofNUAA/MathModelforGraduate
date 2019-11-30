import numpy as np
from keras.models import load_model
import pandas as pd
import pickle
import matplotlib.pyplot as plt\


plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['axes.unicode_minus'] = False

def standardize(train):
    mean = np.mean(train,axis=0)
    std = np.std(train,axis=0)

    X_train = (train-mean)/std
    return X_train

model = load_model('./Models_DNN_huawei/DNN_RSRP_relu_done_Peking.h5')

# filePath = './TestData_huawei/test_112501.dat'
filePath = './Valadation_X_Peking_tanh.dat'
# df = pd.read_csv(filePath)
# data = df[[col for col in df.columns]]
data = np.loadtxt(filePath)
data = standardize(data)
y_true = np.loadtxt('./Valadation_y_Peking_tanh.dat')
y_true = np.array(y_true).reshape((-1,1))
predict_results = model.predict(data)

# y_true = np.loadtxt('./y_test.dat')
# y_true = np.array(y_true).reshape((-1,1))
# predict_results = np.loadtxt('./predictions')
predict_results = np.array(predict_results).reshape((-1,1))
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
plt.plot(predict_results[400:600],'b-o')
plt.plot(y_true[400:600],'r-*')
plt.legend(['DNN网络预测RSRP','真实测量RSRP'])
plt.xlabel('随机测试点')
plt.ylabel('测试点平均接收功率RSRP(dBm)')
f.savefig('Predict_RSRP.jpeg', dpi=600)
plt.show()
# plt.figure(2)
# plt.plot(predict_results,'b-o')
# plt.show()
RMSE = np.sqrt(sum(np.power(y_true-predict_results,2))/len(y_true))
print(RMSE)



#写结果到文件
# np.savetxt('./TestData_huawei/Results_test_112501.dat',predict_results)
# np.savetxt('./Results_Valadation_X_val.dat',predict_results)
# history = pd.read_pickle('./Models_DNN_huawei/DNN_RSRP_history_v1.pkl')
# print(history)
# loss = history['loss']
# val_loss  = history['val_loss'][1:]
# epoches = range(1,len(loss)+1)
# plt.figure(1)
# plt.plot(epoches,loss,'b-o',label='Training loss')
# # plt.plot(epoches,val_loss,'r',label='Validation loss')
# plt.xlabel('Epoches')
# plt.ylabel('Loss')
# # plt.ylim([94,96])
# plt.show()
#
# plt.figure(2)
# acc = history['mse']
# val_acc = history['val_mse'][1:]
# plt.plot(epoches,np.sqrt(acc),'b-o',label='Training loss')
# # plt.plot(epoches,val_acc,'r',label='Validation loss')
# plt.xlabel('Epoches')
# plt.ylabel('RMSE')
# # plt.ylim([9.72,9.77])
# plt.show()
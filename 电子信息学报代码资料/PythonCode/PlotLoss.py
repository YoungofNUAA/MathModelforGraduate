import numpy as np
from keras.models import load_model
import pandas as pd
import pickle
import matplotlib
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['axes.unicode_minus'] = False
myFont = matplotlib.font_manager.FontProperties(fname=r"C:\Windows\Fonts\simsun.ttc",size=6)
myFont_Euclid = matplotlib.font_manager.FontProperties(fname=r"C:\Windows\Fonts\Euclid.ttf",size=6)
#***************************Plot loss******************************
# history = pd.read_pickle('./Models_DNN_AFB_CordRoads/DNN_history_CordRoads_Gap3.pkl')
# print(history)
# energy_loss = history['energy_loss']
# bits_loss  = history['bits_loss']
# epoches = range(1,len(energy_loss)+1)
# plt.figure(1)
# plt.plot(epoches,energy_loss,'b-o')
# plt.xlabel('Epoches')
# plt.ylabel('energy_loss')
# plt.show()
# plt.figure(2)
# plt.plot(epoches,bits_loss,'b-o')
# plt.xlabel('Epoches')
# plt.ylabel('bits_loss')
# plt.show()
#
# plt.figure(3)
# energy_mse = history['energy_mse']
# bits_accuracy = history['bits_accuracy']
# plt.plot(epoches,np.sqrt(energy_mse),'b-o',label='Training loss')
# plt.xlabel('Epoches')
# plt.ylabel('Energy RMSE')
# plt.show()
# plt.figure(4)
# plt.plot(epoches,bits_accuracy,'b-o',label='Validation loss')
# plt.xlabel('Epoches')
# plt.ylabel('bits_accuracy')
# plt.show()

#*****************************华为*******************************
history = pd.read_pickle('./Models_DNN_huawei/DNN_RSRP_history_relu_done_Peking.pkl')
fig1 = plt.figure()
RSRP_RMSE = np.sqrt(history['mse'])
epoches = range(1,len(RSRP_RMSE)+1)
plt.plot(epoches,RSRP_RMSE,'b-o')
plt.xticks(fontproperties=myFont)
plt.yticks(fontproperties=myFont_Euclid)
plt.xlabel('训练轮次',fontproperties=myFont)
plt.ylabel('预测与实际RSRP误差指标RMSE(dBm)',fontproperties=myFont)
fig1.savefig('RMSE.jpeg',dpi=600)
plt.show()
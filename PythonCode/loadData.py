import pickle
import numpy as np
import matplotlib.pyplot as plt
y_test = pickle.load(open('./y_test.txt','rb'))
predictions = pickle.load(open('./predictions.txt','rb'))
# y = y_test[180:200]
# p = predictions[180:200]
# print(y_test[1:100])
# print(predictions[1:200])
# plt.scatter(x=np.linspace(1,len(y_test)),y=y_test[1])
# plt.scatter(x=np.linspace(1,len(predictions)),y=predictions)
# plt.xlabel('测试数据')
# plt.ylabel('Loss (SSE)')
# plt.show()
# MSE = np.sum(np.power(y_test-predictions,2))/len(y_test)
# print("The MSE: %.2f degrees Celcius" %MSE)
# print("The RMSE: %.2f degrees Celcius" % np.sqrt(MSE))

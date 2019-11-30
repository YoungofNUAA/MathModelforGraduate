from keras import Input,Model
from keras import layers
from keras import models
from keras.optimizers import RMSprop
from numpy import random as rd
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
import os
import pickle
from keras.callbacks import ReduceLROnPlateau
from keras.losses import mean_squared_error as MSE
from keras.metrics import mean_squared_error
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

filePath = './Huawei_data/'

def build_model(train_data):
    # Because we will need to instantiate
    # the same model multiple times,
    # we use a function to construct it.
    #*********************CNN****************************
    # model = models.Sequential()
#     # model.add(layers.Conv1D(64,4,activation='relu',input_shape=(None,train_data.shape[-1])))
#     # model.add(layers.MaxPooling1D(4))
#     # model.add(layers.Conv1D(64, 4, activation='relu'))
#     # model.add(layers.MaxPooling1D(4))
#     # model.add(layers.Conv1D(64, 4, activation='relu'))
#     # model.add(layers.GlobalMaxPooling1D())
#     # model.add(layers.Flatten())
#     # model.add(layers.Dense(1))
#     # rmsprop = RMSprop(lr=0.00001, decay=1e-6)
#     # model.compile(optimizer='rmsprop', loss='mse', metrics=['mse'])
#     # return model
    # ***************************************************
    #默认线性激活函数
    model = models.Sequential()
    model.add(layers.Dense(64,activation='relu',
                           input_shape=(train_data.shape[1],)))
    model.add(layers.Dropout(0.5))
    model.add(layers.Dense(64,activation='relu'))
    model.add(layers.Dropout(0.5))
    model.add(layers.Dense(64, activation='relu'))
    model.add(layers.Dropout(0.5))
    model.add(layers.Dense(1))
    rmsprop = RMSprop(lr=0.0001, decay=1e-6)
    model.compile(optimizer=rmsprop, loss='mse', metrics=['mse'])
    return model
def standardize(train,test):
    mean = np.mean(train,axis=0)
    std = np.std(train,axis=0)
    X_train = (train-mean)/std
    X_test = (test-mean)/std
    return X_train,X_test

openFile = './train_data_Peking.dat'

df = pd.read_csv(openFile)
# X = df[[col for col in df.columns if col != 'allRSRP']]
# y = df['allRSRP']
y = df['allRSRP']
df = df.drop(['allRSRP'],axis=1)
X = df[[col for col in df.columns]]
X_train, X_tmp, y_train, y_tmp = train_test_split(X, y, test_size=0.2, random_state=23)
X_test, X_val, y_test, y_val = train_test_split(X_tmp, y_tmp, test_size=0.5, random_state=23)
np.savetxt('Valadation_X_Peking_relu.dat',X_val)
np.savetxt('Valadation_y_Peking_relu.dat',y_val)
[X_train,X_test] = standardize(X_train,X_test)

# X_train.shape, X_test.shape, X_val.shape
print("Training instances   {}, Training features   {}".format(X_train.shape[0], X_train.shape[1]))
print("Validation instances {}, Validation features {}".format(X_val.shape[0], X_val.shape[1]))
print("Testing instances    {}, Testing features    {}".format(X_test.shape[0], X_test.shape[1]))

train_targets = y_train
train_data = X_train
test_data = X_test
test_targets = y_test

num_epochs = 100
# Build the Keras model (already compiled)
model = build_model(train_data)
# Train the model (in silent mode, verbose=0)
# reduce_lr = ReduceLROnPlateau(monitor='val_loss',patience=10,mode='auto')
history = model.fit(train_data, train_targets,
                    validation_data=(test_data, test_targets),
            epochs=num_epochs, batch_size=32, verbose=2,shuffle=True)
model.summary()

modelName = './Models_DNN_huawei' + '/' + 'DNN_RSRP_relu_done_Peking' + '.h5'

historyName =  './Models_DNN_huawei' + '/' + 'DNN_RSRP_history_relu_done_Peking' + '.pkl'
model.save(modelName)
file_to_save_history = open(historyName, 'wb')
pickle.dump(history.history, file_to_save_history)
file_to_save_history.close()
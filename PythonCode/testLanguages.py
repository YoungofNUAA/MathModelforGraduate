import pandas as pd
import numpy as np
import tensorflow as tf
from sklearn.metrics import explained_variance_score, \
    mean_absolute_error, \
    median_absolute_error
from sklearn.model_selection import train_test_split
from makeData import dataRead
import matplotlib.pyplot as plt
import pickle
X = []
y = []
df = pd.read_csv("./train.csv")
print(df.columns)
X = df[[col for col in df.columns if col != 'allRSRP']]
y = df['allRSRP']


X_train, X_tmp, y_train, y_tmp = train_test_split(X, y, test_size=0.2, random_state=23)
X_test, X_val, y_test, y_val = train_test_split(X_tmp, y_tmp, test_size=0.5, random_state=23)

# X_train.shape, X_test.shape, X_val.shape
print("Training instances   {}, Training features   {}".format(X_train.shape[0], X_train.shape[1]))
print("Validation instances {}, Validation features {}".format(X_val.shape[0], X_val.shape[1]))
print("Testing instances    {}, Testing features    {}".format(X_test.shape[0], X_test.shape[1]))

feature_cols = [tf.feature_column.numeric_column(col) for col in X.columns]

regressor = tf.estimator.DNNRegressor(feature_columns=feature_cols,
                                      hidden_units=[32,32],
                                      model_dir='tf_wx_model')

def wx_input_fn(X, y=None, num_epochs=None, shuffle=True, batch_size=400):
    return tf.estimator.inputs.pandas_input_fn(x=X,
                                               y=y,
                                               num_epochs=num_epochs,
                                               shuffle=shuffle,
                                               batch_size=batch_size)


evaluations = []
STEPS = 400
for i in range(100):
    regressor.train(input_fn=wx_input_fn(X_train, y=y_train), steps=STEPS)
    evaluation = regressor.evaluate(input_fn=wx_input_fn(X_val, y_val,
                                                         num_epochs=1,
                                                         shuffle=True),
                                    steps=1)

    evaluations.append(regressor.evaluate(input_fn=wx_input_fn(X_val,
                                                               y_val,
                                                               num_epochs=1,
                                                               shuffle=True)))

evaluations[0]

plt.rcParams['figure.figsize'] = [14, 10]

loss_values = [ev['loss'] for ev in evaluations]
training_steps = [ev['global_step'] for ev in evaluations]

plt.scatter(x=training_steps, y=loss_values)
plt.xlabel('Training steps (Epochs = steps / 2)')
plt.ylabel('Loss (SSE)')
plt.show()

pred = regressor.predict(input_fn=wx_input_fn(X_test,
                                              num_epochs=1,
                                              shuffle=True))
predictions = np.array([p['predictions'][0] for p in pred])

pickle.dump(y_test,open('./y_test.txt','wb'))
pickle.dump(predictions,open('./predictions.txt','wb'))
print(y_test)
print(predictions)
print("The Explained Variance: %.2f" % explained_variance_score(
                                            y_test, predictions))
print("The Mean Absolute Error: %.2f degrees Celcius" % mean_absolute_error(
                                            y_test, predictions))

print("The Median Absolute Error: %.2f degrees Celcius" % median_absolute_error(
                                            y_test, predictions))
MSE = np.sum(np.power(y_test-predictions,2))/len(y_test)
print("The MSE: %.2f degrees Celcius" % np.sum(np.power(y_test-predictions,2))/len(y_test))
print("The RMSE: %.2f degrees Celcius" % np.sqrt(MSE))

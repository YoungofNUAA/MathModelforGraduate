import pandas as pd
import os
import numpy as np
import pandas as pb
import codecs
import csv
def dataRead():
    fileList = []
    for filename in os.listdir(r"C:\Users\Young\Desktop\train_set"):
        pa = r'C:\Users\Young\Desktop\train_set\%s'%filename
        fileList.append(pa)
    print(len(fileList))
    print(fileList)
    filesDatas_train = []
    filesDatas_test = []
    for file in fileList:
        pb_data = pb.read_csv(file)
        input_data_train = np.array(pb_data.get_values()[:,0:18],dtype=np.float32)
        # input_data_test = np.array(pb_data.get_value()[:,17],dtype=np.float32)
        filesDatas_train.append(input_data_train)

    print(len(filesDatas_train))
    np.savetxt('allInfo.csv',filesDatas_train)
    # with open('allInfo.csv','ab+') as csvWrite:
    #
    #     # csvWrite.writelines(['CellIndex','CellX','CellY','Height','Azimuth','ElectricalDowntilt',
    #     #                  'MechanicalDowntilt','FrequencyBand','RSPower','CellAltitude','CellBuildingHeight',
    #     #                  'CellClutterIndex','X','Y','Altitude','BuildingHeight','ClutterIndex','RSRP'])
    #     for data in filesDatas_train:
    #         csvWrite.writelines(data)


if __name__ == '__main__':
    dataRead()
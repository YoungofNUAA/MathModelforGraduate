%预处理数据准备训练
load all_ED.mat;
load all_MD.mat;
load all_X.mat;
load all_Y.mat;
load allAltitude.mat;
load allAzimuth.mat;
load allBuildH.mat;
load allCell_X.mat;
load allCell_Y.mat;
load allCellAltitude.mat;
load allCellBH.mat;
load allF.mat;
load allH.mat;
load allRS.mat;
load allRSRP.mat;
load allCellClutter.mat;
load allClutter.mat;
% load allDelt_hv.mat;
load AllData;
% all_D = sqrt((all_X-allCell_X).^2+(all_Y-allCell_Y).^2);
% all_Hb = allCellAltitude+allH;
% all_deltH = all_Hb - all_D.*tan((all_ED+all_MD)*(2*pi/360));
% all_Hue = allBuildH + allAltitude;
% all_D3 = sqrt((allCell_X-all_X).^2+(allCell_Y-all_Y).^2+(allCellAltitude-allAltitude).^2);
% save all_D3 all_D3;

% all3D = [];
% for i=1:4000
%    all3D = [all3D ;sqrt((all_X-allCell_X).^2+(all_Y-allCell_Y).^2+(allAltitude-allCellAltitude).^2)];
% end
% save all3D all3D;
% 
% allD = (allD-mean(allD))./std(allD);
% allF = (allF-mean(allF))./std(allF);
% deltH = (deltH-mean(deltH))./std(deltH);
% allH = (allH-mean(allH))./std(allH);
% allAzimuth = (allAzimuth-mean(allAzimuth))./std(allAzimuth);

% allCellAltitude = (allCellAltitude-mean(allCellAltitude))./std(allCellAltitude);
% allCellBH = (allCellBH-mean(allCellBH))./std(allCellBH);
% allAltitude = (allAltitude-mean(allAltitude))./std(allAltitude);
% allBuildH = (allBuildH-mean(allBuildH))./std(allBuildH);
% datacolumns = {'D','F','deltH','Height','Azimuth','RSPower','CellAltitude','CellBuildingHeight',....
%     'CellClutter','Altitude','BuildingHeight','ClutterIndex','RSRP'};
% data = table(all_D,all_D3,all_deltH,all_Hue,allCellClutter,allF,allAzimuth,all_Hb,allH,allCellBH,allCellAltitude,allRS,allRSRP);
% writetable(data,'train_data.dat');

% fid = fopen('train_data.dat','w+');
% title = ['all_D','all_D3','all_deltH','all_Hue','allCellClutter','allF','allAzimuth',.....
%     'all_Hb','allH','allCellBH','allCellAltitude','allRS','allRSRP'];

% pre = importdata('./predictions');
% y_test = importdata('./y_test.dat');
% plot(pre(1:1000),'b-o')
% hold on;
% plot(y_test(1:1000),'r-*')


%% train_data_v2
% all_Hb = allCellAltitude+allH;
% all_D = sqrt((all_X-allCell_X).^2+(all_Y-allCell_Y).^2);
% all_deltH = all_Hb - all_D.*tan((all_ED+all_MD)*(2*pi/360));
% all_angle = (atan((all_X-allCell_X)./(all_Y-allCell_Y))-allAzimuth)*pi/180;  
% all_DiffHeight = allH-allBuildH;
% allClutter = allClutter;
% allRS = allRS;
% 
% data = table(all_D,all_deltH,all_angle,all_DiffHeight,allClutter,allRS,allRSRP);
% writetable(data,'train_data_v2.dat');

%% train_data_v3   北大20指标
CellClutterIndex = allCellClutter;
CellAltitude = allCellAltitude;
Angle_North = zeros(length(allCellClutter),1);
index = find(all_X>=allCell_X);
Angle_North(index) = acos((all_Y(index))./(sqrt(all_X(index).^2+all_Y(index).^2))).*(180/pi);
index1 = find(all_X<allCell_X);
Angle_North(index1) = 360 - acos((all_Y(index1))./(sqrt(all_X(index1).^2+all_Y(index1).^2))).*(180/pi);
Height = allH;
Angle_horizontal = zeros(length(allCellClutter),1);
index2 = find((Angle_North-allAzimuth)<=180);
Angle_horizontal(index2) = Angle_North(index2)-allAzimuth(index2);
index3 = find((Angle_North-allAzimuth)>180);
Angle_horizontal(index3) = 360 - (Angle_North(index3)-allAzimuth(index3));
TransPower = allRS;
Altitude = allAltitude;
CellAzimuth = allAzimuth;
CellBuildingHeight = allCellBH;
CellBuildingHeight(find(CellBuildingHeight==0)) = 1e-5;
CellMD = all_MD;
SignalAngleDown = all_ED+all_MD;
SignalOnHeight = allH+allCellAltitude-allAltitude-tan(SignalAngleDown).*sqrt((allCell_X-all_X).^2+(allCell_Y-all_Y).^2);
Distance_horizontal = sqrt((allCell_X-all_X).^2+(allCell_Y-all_Y).^2);
BuildHeight = allBuildH;
BuildHeight(find(BuildHeight==0)) = 1e-5;
TransF = allF;
LinkDistance = sqrt((allCell_X-all_X).^2+(allCell_Y-all_Y).^2+(allH+allCellAltitude-allAltitude).^2);
ClutterIndex = allClutter;
LinkDistance(find(LinkDistance==0)) = 1e-5;
LinkLoss = 32.44 + 20*log10(TransF)+20*log10(LinkDistance);
CellED = all_ED;
CellOnHeight = Height+CellAltitude-Altitude;


data = table(CellClutterIndex,CellAltitude,Angle_North,Height,Angle_horizontal,....
    TransPower,Altitude,CellAzimuth,CellBuildingHeight,CellMD,SignalAngleDown,SignalOnHeight,.....
    Distance_horizontal,BuildHeight,TransF,LinkDistance,ClutterIndex,LinkLoss,CellED,CellOnHeight,allRSRP);
%     'VariableNames',{'基站地理类型','基站所在栅格海拔高度','基站所在栅格绝对高度','测试点与正北方向夹角',...
%     '基站相对水平面高度','基站与测试点空间角','基站发射信号功率','基站所在栅格海拔高度','发射信号与正北方向夹角',...
%     '基站所在栅格建筑物高度','基站发射机垂直机械下倾角','信号实际下倾角','信号强度中心与测试点相对高度','基站与测试点栅格水平距离',...
%     '测试点所在栅格建筑物高度','基站发射信号中心频率','基站与测试点直射链路距离','测试点所在栅格地理类型','直射信号路径损耗',...
%     '基站发射机电下倾角'});
writetable(data,'train_data_Peking.dat');

%% 原始训练数据集
% CellX = [];
% CellY = [];
% Height = [];
% Azimuth = [];
% ElectricalDown = [];
% MechanicalDown = [];
% FrequencyBand = [];
% RSPower = [];
% CellAltitude = [];
% CellBuilding = [];
% CellClutterIndex = [];
% X = [];
% Y = [];
% Altitude = [];
% BuildingHeight = [];
% ClutterIndex = [];
% RSRP = [];
% for i = 1:4000
%     CellX = [CellX;AllData{1,i}(:,2)];
%     CellY = [CellY;AllData{1,i}(:,3)];
%     Height = [Height;AllData{1,i}(:,4)];
%     Azimuth = [Azimuth;AllData{1,i}(:,5)];
%     ElectricalDown = [ElectricalDown;AllData{1,i}(:,6)];
%     MechanicalDown = [MechanicalDown;AllData{1,i}(:,7)];
%     FrequencyBand = [FrequencyBand;AllData{1,i}(:,8)];
%     RSPower = [RSPower;AllData{1,i}(:,9)];
%     CellAltitude = [CellAltitude;AllData{1,i}(:,10)];
%     CellBuilding = [CellBuilding;AllData{1,i}(:,11)];
%     CellClutterIndex = [CellClutterIndex;AllData{1,i}(:,12)];
%     X = [X;AllData{1,i}(:,13)];
%     Y = [Y;AllData{1,i}(:,14)];
%     Altitude = [Altitude;AllData{1,i}(:,15)];
%     BuildingHeight = [BuildingHeight;AllData{1,i}(:,16)];
%     ClutterIndex = [ClutterIndex;AllData{1,i}(:,17)];
%     RSRP = [RSRP;AllData{1,i}(:,18)];
% end
% data = table(CellX,CellY,Height,Azimuth,ElectricalDown,MechanicalDown,......
%     FrequencyBand,RSPower,CellAltitude,CellBuilding,CellClutterIndex,......
%     X,Y,Altitude,BuildingHeight,ClutterIndex,RSRP);
% writetable(data,'train_data_origin.dat');
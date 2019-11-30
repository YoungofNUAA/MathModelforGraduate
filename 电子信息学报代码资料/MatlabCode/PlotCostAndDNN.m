% load allClutter.mat;
% load allRSRP.mat;
% load allF.mat;
% 
% index_18 = find(allClutter==18);
% index_18 = index_18(randi([1,4492],200,1));
% real_RSRP = allRSRP(index_18);
% alpha = 3.2*(log10(1.54*allAltitude(index_18)));
% d = sqrt((allCell_X(index_18)-all_X(index_18)).^2+(allCell_Y(index_18)-all_Y(index_18)).^2);
% d = d/1000;
% Cland = -2*(log10(allF(index_18))/28).^2-5.4;
% % Cland = -4.78*log10(allF(index_18))-18.33*log10(allF(index_18))-40.98;
% Ploss_dB = 46.3+33.9*log10(allF(index_18))-13.82*log10(allH(index_18)+allCellAltitude(index_18))...
%     -alpha+(44.9-6.55*log10(allH(index_18))).*log10(d)+Cland;
% pre_RSRP = allRS(index_18)-(Ploss_dB);
% data = table(index_18,real_RSRP,pre_RSRP);
% writetable(data,'Index_18.dat');
% plot(real_RSRP,'b-o');
% hold on
% plot(pre_RSRP,'r-*');
% RMSE = sqrt(sum((pre_RSRP-real_RSRP).^2)/length(real_RSRP))

%%   北大20指标
% CellClutterIndex = allCellClutter;
% CellAltitude = allCellAltitude;
% Angle_North = zeros(length(allCellClutter),1);
% index = find(all_X>=allCell_X);
% Angle_North(index) = acos((all_Y(index))./(sqrt(all_X(index).^2+all_Y(index).^2))).*(180/pi);
% index1 = find(all_X<allCell_X);
% Angle_North(index1) = 360 - acos((all_Y(index1))./(sqrt(all_X(index1).^2+all_Y(index1).^2))).*(180/pi);
% Height = allH;
% Angle_horizontal = zeros(length(allCellClutter),1);
% index2 = find((Angle_North-allAzimuth)<=180);
% Angle_horizontal(index2) = Angle_North(index2)-allAzimuth(index2);
% index3 = find((Angle_North-allAzimuth)>180);
% Angle_horizontal(index3) = 360 - (Angle_North(index3)-allAzimuth(index3));
% TransPower = allRS;
% Altitude = allAltitude;
% CellAzimuth = allAzimuth;
% CellBuildingHeight = allCellBH;
% CellBuildingHeight(find(CellBuildingHeight==0)) = 1e-5;
% CellMD = all_MD;
% SignalAngleDown = all_ED+all_MD;
% SignalOnHeight = allH+allCellAltitude-allAltitude-tan(SignalAngleDown).*sqrt((allCell_X-all_X).^2+(allCell_Y-all_Y).^2);
% Distance_horizontal = sqrt((allCell_X-all_X).^2+(allCell_Y-all_Y).^2);
% BuildHeight = allBuildH;
% BuildHeight(find(BuildHeight==0)) = 1e-5;
% TransF = allF;
% LinkDistance = sqrt((allCell_X-all_X).^2+(allCell_Y-all_Y).^2+(allH+allCellAltitude-allAltitude).^2);
% ClutterIndex = allClutter;
% LinkDistance(find(LinkDistance==0)) = 1e-5;
% LinkLoss = 32.44 + 20*log10(TransF)+20*log10(LinkDistance);
% CellED = all_ED;
% CellOnHeight = Height+CellAltitude-Altitude;
% 
% 
% % data = table(CellClutterIndex(index_11),CellAltitude(index_11),Angle_North(index_11),Height(index_11),Angle_horizontal(index_11),....
% %     TransPower(index_11),Altitude(index_11),CellAzimuth(index_11),CellBuildingHeight(index_11),CellMD(index_11),SignalAngleDown(index_11),SignalOnHeight(index_11),.....
% %     Distance_horizontal(index_11),BuildHeight(index_11),TransF(index_11),LinkDistance(index_11),ClutterIndex(index_11),LinkLoss(index_11),CellED(index_11),CellOnHeight(index_11),allRSRP(index_11));
% %     'VariableNames',{'基站地理类型','基站所在栅格海拔高度','基站所在栅格绝对高度','测试点与正北方向夹角',...
% %     '基站相对水平面高度','基站与测试点空间角','基站发射信号功率','基站所在栅格海拔高度','发射信号与正北方向夹角',...
% %     '基站所在栅格建筑物高度','基站发射机垂直机械下倾角','信号实际下倾角','信号强度中心与测试点相对高度','基站与测试点栅格水平距离',...
% %     '测试点所在栅格建筑物高度','基站发射信号中心频率','基站与测试点直射链路距离','测试点所在栅格地理类型','直射信号路径损耗',...
% %     '基站发射机电下倾角'});
% 
% % fid = fopen('test_index11_v1.dat');
% % fprintf(fid,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f',...
% %     CellClutterIndex(index_11),CellAltitude(index_11),Angle_North(index_11),Height(index_11),Angle_horizontal(index_11),....
% %     TransPower(index_11),Altitude(index_11),CellAzimuth(index_11),CellBuildingHeight(index_11),CellMD(index_11),SignalAngleDown(index_11),SignalOnHeight(index_11),.....
% %     Distance_horizontal(index_11),BuildHeight(index_11),TransF(index_11),LinkDistance(index_11),ClutterIndex(index_11),LinkLoss(index_11),CellED(index_11),CellOnHeight(index_11));
% % % fclose(fid);
% data_index18 = [CellClutterIndex(index_18),CellAltitude(index_18),Angle_North(index_18),Height(index_18),Angle_horizontal(index_18),....
%     TransPower(index_18),Altitude(index_18),CellAzimuth(index_18),CellBuildingHeight(index_18),CellMD(index_18),SignalAngleDown(index_18),SignalOnHeight(index_18),.....
%     Distance_horizontal(index_18),BuildHeight(index_18),TransF(index_18),LinkDistance(index_18),ClutterIndex(index_18),LinkLoss(index_18),CellED(index_18),CellOnHeight(index_18)];
% save data_index18 data_index18

clear all
clc

data = importdata('./Index_18.dat');
real = data.data(:,2);
pre_COST = data.data(:,3);
data_DNN = importdata('./pre_DNN_18.dat');
pre_DNN = data_DNN;
figure(1)
plot(pre_COST,'b-o');
hold on
plot(real,'r-*');
set(gca,'XMinorGrid','on','LineWidth',0.5)
set(gca,'YMinorGrid','on','LineWidth',0.5)
legend('COST231-Hata模型预测RSRP','真实测量RSRP')
xlabel('随机测试点');
ylabel('真实测量和模型预测RSRP(dBm)')

figure(2)
plot(pre_DNN,'b-o');
hold on
plot(real,'r-*');
set(gca,'XMinorGrid','on','LineWidth',0.5)
set(gca,'YMinorGrid','on','LineWidth',0.5)
legend('DNN网络模型预测RSRP','真实测量RSRP')
xlabel('随机测试点');
ylabel('真实测量和模型预测RSRP(dBm)')
% aa = (data.data(:,3));
% bb = (data.data(:,2));
% index = isinf(aa);
% aa(index==1)=[];
% bb(index==1)=[];
% min(aa)
% max(aa)
% mean(aa)
% var(aa)
% sqrt(sum((bb-aa).^2)/length(bb))
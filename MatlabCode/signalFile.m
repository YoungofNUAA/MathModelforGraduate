fileList = ls('C:\Users\Young\Desktop\train_set');
data = importdata(strcat('C:\Users\Young\Desktop\train_set',strcat('\',fileList(3,:))));
x1 = data.data(:,13)-data.data(:,2);
y1 = data.data(:,14)-data.data(:,3);
r = -10 + (20)*rand(2207,1);
prsp = data.data(:,18)+r;
figure(1)
imagesc(x1,y1,prsp);
% data = importdata(strcat('C:\Users\Young\Desktop\test_set\train_108401.csv'));
% CellINdex = data.data(:,1);
% CellX = data.data(:,2);
% CellY = data.data(:,3);
% Height = data.data(:,4);
% Azimuth = data.data(:,5);
% ElectricalDowntilt = data.data(:,6);
% MechanicalDowntilt = data.data(:,7);
% FrequencyBand = data.data(:,8);
% RSPower = data.data(:,9);
% CellAltitude = data.data(:,10)
% CellBuildingHeight = data.data(:,11);
% CellClutterIndex = data.data(:,12);
% X = data.data(:,13);
% Y = data.data(:,14);
% Altitude = data.data(:,15);
% BuildingHeight = data.data(:,16);
% ClutterIndex = data.data(:,17);
% 
% dataToWrite = table(CellINdex,CellX,CellY,Height,Azimuth,ElectricalDowntilt,MechanicalDowntilt,FrequencyBand,...
%     RSPower,CellAltitude,CellBuildingHeight,CellClutterIndex,X,Y,Altitude,BuildingHeight,ClutterIndex);
% writetable(dataToWrite,'test_108401.csv');
%% Cost 231-Hata
% d = data.data(:,2)-data.data(:,13);
% hb = data.data(:,4);
% theta = (data.data(:,6)+data.data(:,7)).*(2*pi/360);
% d1 = sqrt((data.data(:,13)-data.data(:,2)).^2+(data.data(:,14)-data.data(:,3)).^2);
% deltH = -(hb-d1.*theta-data.data(:,15));
% PL = 46.3+33.9*log10(data.data(:,8))-13.82*log10(data.data(:,4)+data.data(:,11))+(44.9-6.55*log10(data.data(:,15)+data.data(:,16))).*log10(d1);
% RSRP = data.data(:,9)-PL;
% power = deltH;
% Y_pre = data.data(:,9)-data.data(:,18);
% X = [ones(length(Y_pre),1),power];
% [b,bint,r,rint,stats] = regress(Y_pre,X)
% 残差分析
% figure(1)
% rcoplot(r,rint);
% % 预测
% figure(2)
% z = b(1)+b(2)*power;
% plot((power),Y_pre,'k+',(power),z,'r')
% xlabel('deltH')
% ylabel('RS-RSRP')
% 
% 
% %% 二元回归
% figure(3)
% x1 = (d1);
% x2 = (deltH);    % Contains NaN data
% y = data.data(:,9)-data.data(:,18);
% 
% X = [ones(size(x1)) x1 x2 x1.*x2];
% [b,bint,r,rint,stats2] = regress(y,X)    % Removes NaN data
% 
% scatter3(x1,x2,y,'filled')
% hold on
% x1fit = min(x1):(max(x1)-min(x1))/100:max(x1);
% x2fit = min(x2):(max(x2)-min(x2))/100:max(x2);
% [X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
% YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
% mesh(X1FIT,X2FIT,YFIT)
% xlabel('基站距离接收点距离')
% ylabel('deltH')
% zlabel('RS-RSRP')
% view(50,10)
%%  ^^^^^^
% to_index_2 = find(data.data(:,17)==2);
% to_index_10 = find(data.data(:,17)==10);
% to_index_17 = find(data.data(:,17)==17);
% d = sqrt((data.data(:,13)-data.data(:,2)).^2+(data.data(:,14)-data.data(:,3)).^2);
% rs = data.data(:,9);
% rsrp = data.data(:,18);
% figure(1)
% x = d(to_index_2);
% y = rs(to_index_2)-rsrp(to_index_2);
% plot(x,y,'-ob');
% hold on;
% x = d(to_index_10);
% y = rs(to_index_10)-rsrp(to_index_10);
% plot(x,y,'-*r');
% hold on;
% x = d(to_index_17);
% y = rs(to_index_17)-rsrp(to_index_17);
% plot(x,y,'-^k');
% hold on;

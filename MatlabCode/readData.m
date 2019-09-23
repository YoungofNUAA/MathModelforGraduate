load AllData.mat;
load allD.mat;
load allIndex.mat;
load allRS.mat;
load allRSRP.mat;
load allF.mat;
load allH.mat;
% plot(data.data(:,18))

%% 地标index
 allClutter = [];
for i=1:4000
   allClutter = [allClutter ;AllData{1,i}(:,17)];
end
save allClutter allClutter;
index_1 = find(allIndex==1);
index_2 = find(allIndex==2);
index_3 = find(allIndex==3);
index_4 = find(allIndex==4);
index_5 = find(allIndex==5);
index_6 = find(allIndex==6);
index_7 = find(allIndex==7);
index_8 = find(allIndex==8);
index_9 = find(allIndex==9);
index_10 = find(allIndex==10);
index_11 = find(allIndex==11);
index_12 = find(allIndex==12);
index_13 = find(allIndex==13);
index_14 = find(allIndex==14);
index_15 = find(allIndex==15);
index_16 = find(allIndex==16);
index_17 = find(allIndex==17);
index_18 = find(allIndex==18);
index_19 = find(allIndex==19);
index_20 = find(allIndex==20);
% 
RS_index_1 = allRS(index_1);
RS_index_2 = allRS(index_2);
RS_index_3 = allRS(index_3);
RS_index_4 = allRS(index_4);
RS_index_5 = allRS(index_5);
RS_index_6 = allRS(index_6);
RS_index_7 = allRS(index_7);
RS_index_8 = allRS(index_8);
RS_index_9 = allRS(index_9);
RS_index_10 = allRS(index_10);
RS_index_11 = allRS(index_11);
RS_index_12 = allRS(index_12);
RS_index_13 = allRS(index_13);
RS_index_14 = allRS(index_14);
RS_index_15 = allRS(index_15);
RS_index_16 = allRS(index_16);
RS_index_17 = allRS(index_17);
RS_index_18 = allRS(index_18);
RS_index_19 = allRS(index_19);
RS_index_20 = allRS(index_20);

RSRP_index_1 = allRSRP(index_1);
RSRP_index_2 = allRSRP(index_2);
RSRP_index_3 = allRSRP(index_3);
RSRP_index_4 = allRSRP(index_4);
RSRP_index_5 = allRSRP(index_5);
RSRP_index_6 = allRSRP(index_6);
RSRP_index_7 = allRSRP(index_7);
RSRP_index_8 = allRSRP(index_8);
RSRP_index_9 = allRSRP(index_9);
RSRP_index_10 = allRSRP(index_10);
RSRP_index_11 = allRSRP(index_11);
RSRP_index_12 = allRSRP(index_12);
RSRP_index_13 = allRSRP(index_13);
RSRP_index_14 = allRSRP(index_14);
RSRP_index_15 = allRSRP(index_15);
RSRP_index_16 = allRSRP(index_16);
RSRP_index_17 = allRSRP(index_17);
RSRP_index_18 = allRSRP(index_18);
RSRP_index_19 = allRSRP(index_19);
RSRP_index_20 = allRSRP(index_20);

D_index_1 = allD(index_1);
D_index_2 = allD(index_2);
D_index_3 = allD(index_3);
D_index_4 = allD(index_4);
D_index_5 = allD(index_5);
D_index_6 = allD(index_6);
D_index_7 = allD(index_7);
D_index_8 = allD(index_8);
D_index_9 = allD(index_9);
D_index_10 = allD(index_10);
D_index_11 = allD(index_11);
D_index_12 = allD(index_12);
D_index_13 = allD(index_13);
D_index_14 = allD(index_14);
D_index_15 = allD(index_15);
D_index_16 = allD(index_16);
D_index_17 = allD(index_17);
D_index_18 = allD(index_18);
D_index_19 = allD(index_19);
D_index_20 = allD(index_20);

F_index_1 = allF(index_1);
F_index_2 = allF(index_2);
F_index_3 = allF(index_3);
F_index_4 = allF(index_4);
F_index_5 = allF(index_5);
F_index_6 = allF(index_6);
F_index_7 = allF(index_7);
F_index_8 = allF(index_8);
F_index_9 = allF(index_9);
F_index_10 = allF(index_10);
F_index_11 = allF(index_11);
F_index_12 = allF(index_12);
F_index_13 = allF(index_13);
F_index_14 = allF(index_14);
F_index_16 = allF(index_16);
F_index_17 = allF(index_17);
F_index_18 = allF(index_18);
F_index_19 = allF(index_19);
F_index_20 = allF(index_20);

H_index_1 = allH(index_1);
H_index_2 = allH(index_2);
H_index_3 = allH(index_3);
H_index_4 = allH(index_4);
H_index_5 = allH(index_5);
H_index_6 = allH(index_6);
H_index_7 = allH(index_7);
H_index_8 = allH(index_8);
H_index_9 = allH(index_9);
H_index_10 = allH(index_10);
H_index_11 = allH(index_11);
H_index_12 = allH(index_12);
H_index_13 = allH(index_13);
H_index_14 = allH(index_14);
H_index_15 = allH(index_15);
H_index_16 = allH(index_16);
H_index_17 = allH(index_17);
H_index_18 = allH(index_18);
H_index_19 = allH(index_19);
H_index_20 = allH(index_20);


CellBH_index_1 = allCellBH(index_1);
CellBH_index_2 = allCellBH(index_2);
CellBH_index_3 = allCellBH(index_3);
CellBH_index_4 = allCellBH(index_4);
CellBH_index_5 = allCellBH(index_5);
CellBH_index_6 = allCellBH(index_6);
CellBH_index_7 = allCellBH(index_7);
CellBH_index_8 = allCellBH(index_8);
CellBH_index_9 = allCellBH(index_9);
CellBH_index_10 = allCellBH(index_10);
CellBH_index_11 = allCellBH(index_11);
CellBH_index_12 = allCellBH(index_12);
CellBH_index_13 = allCellBH(index_13);
CellBH_index_14 = allCellBH(index_14);
CellBH_index_15 = allCellBH(index_15);
CellBH_index_16 = allCellBH(index_16);
CellBH_index_17 = allCellBH(index_17);
CellBH_index_18 = allCellBH(index_18);
CellBH_index_19 = allCellBH(index_19);
CellBH_index_20 = allCellBH(index_20);

Altitude_index_1 = allAltitude(index_1);
Altitude_index_2 = allAltitude(index_2);
Altitude_index_3 = allAltitude(index_3);
Altitude_index_4 = allAltitude(index_4);
Altitude_index_5 = allAltitude(index_5);
Altitude_index_6 = allAltitude(index_6);
Altitude_index_7 = allAltitude(index_7);
Altitude_index_8 = allAltitude(index_8);
Altitude_index_9 = allAltitude(index_9);
Altitude_index_10 = allAltitude(index_10);
Altitude_index_11 = allAltitude(index_11);
Altitude_index_12 = allAltitude(index_12);
Altitude_index_13 = allAltitude(index_13);
Altitude_index_14 = allAltitude(index_14);
Altitude_index_15 = allAltitude(index_15);
Altitude_index_16 = allAltitude(index_16);
Altitude_index_17 = allAltitude(index_17);
Altitude_index_18 = allAltitude(index_18);
Altitude_index_19 = allAltitude(index_19);
Altitude_index_20 = allAltitude(index_20);

BuildH_index_1 = allBuildH(index_1);
BuildH_index_2 = allBuildH(index_2);
BuildH_index_3 = allBuildH(index_3);
BuildH_index_4 = allBuildH(index_4);
BuildH_index_5 = allBuildH(index_5);
BuildH_index_6 = allBuildH(index_6);
BuildH_index_7 = allBuildH(index_7);
BuildH_index_8 = allBuildH(index_8);
BuildH_index_9 = allBuildH(index_9);
BuildH_index_10 = allBuildH(index_10);
BuildH_index_11 = allBuildH(index_11);
BuildH_index_12 = allBuildH(index_12);
BuildH_index_13 = allBuildH(index_13);
BuildH_index_14 = allBuildH(index_14);
BuildH_index_15 = allBuildH(index_15);
BuildH_index_16 = allBuildH(index_16);
BuildH_index_17 = allBuildH(index_17);
BuildH_index_18 = allBuildH(index_18);
BuildH_index_19 = allBuildH(index_19);
BuildH_index_20 = allBuildH(index_20);

CellX_index_1 = allCell_X(index_1);
CellX_index_2 = allCell_X(index_2);
CellX_index_3 = allCell_X(index_3);
CellX_index_4 = allCell_X(index_4);
CellX_index_5 = allCell_X(index_5);
CellX_index_6 = allCell_X(index_6);
CellX_index_7 = allCell_X(index_7);
CellX_index_8 = allCell_X(index_8);
CellX_index_9 = allCell_X(index_9);
CellX_index_10 = allCell_X(index_10);
CellX_index_11 = allCell_X(index_11);
CellX_index_12 = allCell_X(index_12);
CellX_index_13 = allCell_X(index_13);
CellX_index_14 = allCell_X(index_14);
CellX_index_15 = allCell_X(index_15);
CellX_index_16 = allCell_X(index_16);
CellX_index_17 = allCell_X(index_17);
CellX_index_18 = allCell_X(index_18);
CellX_index_19 = allCell_X(index_19);
CellX_index_20 = allCell_X(index_20);

CellY_index_1 = allCell_Y(index_1);
CellY_index_2 = allCell_Y(index_2);
CellY_index_3 = allCell_Y(index_3);
CellY_index_4 = allCell_Y(index_4);
CellY_index_5 = allCell_Y(index_5);
CellY_index_6 = allCell_Y(index_6);
CellY_index_7 = allCell_Y(index_7);
CellY_index_8 = allCell_Y(index_8);
CellY_index_9 = allCell_Y(index_9);
CellY_index_10 = allCell_Y(index_10);
CellY_index_11 = allCell_Y(index_11);
CellY_index_12 = allCell_Y(index_12);
CellY_index_13 = allCell_Y(index_13);
CellY_index_14 = allCell_Y(index_14);
CellY_index_15 = allCell_Y(index_15);
CellY_index_16 = allCell_Y(index_16);
CellY_index_17 = allCell_Y(index_17);
CellY_index_18 = allCell_Y(index_18);
CellY_index_19 = allCell_Y(index_19);
CellY_index_20 = allCell_Y(index_20);

X_index_1 = all_X(index_1);
X_index_2 = all_X(index_2);
X_index_3 = all_X(index_3);
X_index_4 = all_X(index_4);
X_index_5 = all_X(index_5);
X_index_6 = all_X(index_6);
X_index_7 = all_X(index_7);
X_index_8 = all_X(index_8);
X_index_9 = all_X(index_9);
X_index_10 = all_X(index_10);
X_index_11 = all_X(index_11);
X_index_12 = all_X(index_12);
X_index_13 = all_X(index_13);
X_index_14 = all_X(index_14);
X_index_15 = all_X(index_15);
X_index_16 = all_X(index_16);
X_index_17 = all_X(index_17);
X_index_18 = all_X(index_18);
X_index_19 = all_X(index_19);
X_index_20 = all_X(index_20);

Y_index_1 = all_Y(index_1);
Y_index_2 = all_Y(index_2);
Y_index_3 = all_Y(index_3);
Y_index_4 = all_Y(index_4);
Y_index_5 = all_Y(index_5);
Y_index_6 = all_Y(index_6);
Y_index_7 = all_Y(index_7);
Y_index_8 = all_Y(index_8);
Y_index_9 = all_Y(index_9);
Y_index_10 = all_Y(index_10);
Y_index_11 = all_Y(index_11);
Y_index_12 = all_Y(index_12);
Y_index_13 = all_Y(index_13);
Y_index_14 = all_Y(index_14);
Y_index_15 = all_Y(index_15);
Y_index_16 = all_Y(index_16);
Y_index_17 = all_Y(index_17);
Y_index_18 = all_Y(index_18);
Y_index_19 = all_Y(index_19);
Y_index_20 = all_Y(index_20);
%% Cost 231-Hata
% d = data.data(:,2)-data.data(:,13);
% hb = data.data(:,4);
% theta = (data.data(:,6)+data.data(:,7)).*(2*pi/360);
% deltH = hb-d.*theta-data.data(:,15);
% d1 = sqrt((data.data(:,13)-data.data(:,2)).^2+(data.data(:,14)-data.data(:,3)).^2);
% PL = 46.3+33.9*log10(data.data(:,8))-13.82*log10(data.data(:,4)+data.data(:,11))+(44.9-6.55*log10(data.data(:,15)+data.data(:,16))).*log10(d1);
% RSRP = data.data(:,9)-PL;
% power = deltH;
% Y_pre = RSRP;
% X = [ones(length(Y_pre),1),power];
% [b,bint,r,rint,stats] = regress(Y_pre,X)

% x = D_index_2(1:1000,1);
% Y_pre = RS_index_2(1:1000)-RSRP_index_2(1:1000,1);
% X = [ones(length(Y_pre),1),x];
% [b,bint,r,rint,stats] = regress(Y_pre,X)
%残差分析
% figure(1)
% rcoplot(r,rint);

%预测
% figure(2)
% z = b(1)+b(2)*x;
% plot(log10(x),Y_pre,'k+',log10(x),z,'r')

%%二元分析
figure(1)
x1 = (D_index_2);
x2 = F_index_2;    % Contains NaN data
y = RS_index_2-RSRP_index_2;

X = [ones(size(x1)) x1 x2 x1.*x2];
[b,bint,r,rint,stats] = regress(y,X)    % Removes NaN data

scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):10:max(x1);
x2fit = min(x2):1:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('基站距离接收点距离')
ylabel('基站发射中心频率')
zlabel('链路损耗')
title('城区超高建筑场景')
view(50,10)

figure(2)
x1 = D_index_5;
x2 = F_index_5;    % Contains NaN data
y = RS_index_5-RSRP_index_5;

X = [ones(size(x1)) x1 x2 x1.*x2];
[b,bint,r,rint,stats1] = regress(y,X)    % Removes NaN data

scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):10:max(x1);
x2fit = min(x2):1:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('基站距离接收点距离')
ylabel('基站发射中心频率')
zlabel('链路损耗')
title('高密度工业建筑场景')
view(50,10)

figure(3)
x1 = D_index_8;
x2 = F_index_8;    % Contains NaN data
y = RS_index_8-RSRP_index_8;

X = [ones(size(x1)) x1 x2 x1.*x2];
[b,bint,r,rint,stats2] = regress(y,X)    % Removes NaN data

scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):10:max(x1);
x2fit = min(x2):1:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('基站距离接收点距离')
ylabel('基站发射中心频率')
zlabel('链路损耗')
title('城郊场景')
view(50,10)
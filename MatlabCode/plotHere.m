figure(1)
toIndex = find(F_index_5==FStyle(1));
toF = F_index_5(toIndex);

toH = H_index_5(toIndex);
toCellBH = CellBH_index_5(toIndex);
toAltitude = Altitude_index_5(toIndex);
toBuildH = BuildH_index_5(toIndex);
toX = X_index_5(toIndex);
toY = Y_index_5(toIndex);
toCellX = CellX_index_5(toIndex);
toCellY = CellY_index_5(toIndex);
d1 = sqrt((toX-toCellX).^2+(toY-toCellY).^2);
% alpha = (1.11*log10(toF)-0.7).*(toBuildH+toAltitude)-(1.56*log10(toF)-0.8);
% alpha = 3.2*(log10(1.54).*(toAltitude+toBuildH))-4.97;
% Cc = -4.78*(log10(toF))-18.33*log10(toF)-40.98;
Cc = 0;
Cm = 3-30;
PL = 46.3+33.9*log10(toF)-13.82*log10(toH)+(44.9-6.55*log10(toAltitude+toBuildH)).*log10(d1./1000)-30;
y = RS_index_5(toIndex)-RSRP_index_5(toIndex);
plot(PL,'ob');
hold on;
plot(y,'*r');
legend('模型理论数值','实测数据数值')
title('模型PL与实测数据RS-RSRP对比---f=2585(城区高层建筑场景)');
RMSE = sqrt(sum((y(1:100000,1)-PL(1:100000,1)).^2))/100000

% toIndex = find(F_index_2==FStyle(2));
% x = D_index_2(toIndex);
% y = RS_index_2(toIndex)-RSRP_index_2(toIndex);
% plot(log10(x),y,'*r');
% hold on
% toIndex = find(F_index_2==FStyle(3));
% x = D_index_2(toIndex);
% y = RS_index_2(toIndex)-RSRP_index_2(toIndex);
% plot(log10(x),y,'^k');
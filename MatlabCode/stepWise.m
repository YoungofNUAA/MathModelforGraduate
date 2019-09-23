%逐步回归统计分析
toIndex = find(F_index_10==FStyle(1));
toF = F_index_10(toIndex);
toH = H_index_10(toIndex);
toCellBH = CellBH_index_10(toIndex);
toAltitude = Altitude_index_10(toIndex);
toBuildH = BuildH_index_10(toIndex);
toX = X_index_10(toIndex);
toY = Y_index_10(toIndex);
toCellX = CellX_index_10(toIndex);
toCellY = CellY_index_10(toIndex);


theta = (data.data(:,6)+data.data(:,7)).*(2*pi/360);
d1 = sqrt((data.data(:,13)-data.data(:,2)).^2+(data.data(:,14)-data.data(:,3)).^2);
deltH = hb-d1.*theta-data.data(:,15);
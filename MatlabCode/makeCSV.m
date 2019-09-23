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
load allD.mat;
load allF.mat;
load allH.mat;
load allIndex.mat;
load allRS.mat;
load allRSRP.mat;
load allCellClutter.mat;
load allClutter.mat;
load allDelt_hv.mat;
load all_D3.mat;
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
data = table(allD,allF,allDelt_hv,allH,allAzimuth,allRS,allCellAltitude,allCellBH,allCellClutter,allAltitude,...
    allBuildH,allClutter,all_D3,allRSRP);
writetable(data,'train.csv');
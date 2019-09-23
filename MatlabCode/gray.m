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
load allHue.mat;
load allH_eff.mat;
PL = (allRS-allRSRP);
x = [PL(1:100000,1),allD(1:100000,1),allAzimuth(1:100000,1),allF(1:100000,1),....
    allDelt_hv(1:100000,1),allH_eff(1:100000,1),allHue(1:100000,1)];
column_num=size(x,2);
index_num=size(x,1);
% 1�����ݾ�ֵ������
x_mean=mean(x,2);
for i = 1:index_num
    x(i,:) = x(i,:)/x_mean(i,1);
end
% 2����ȡ�ο����кͱȽ϶���
ck=x(1,:);
cp=x(2:end,:);
cp_index_num=size(cp,1);

%�Ƚ϶�����ο��������
t=[];
for j = 1:cp_index_num
    t=[t;cp(j,:)-ck];
end
%���������С��
mmax=max(max(abs(t)));
mmin=min(min(abs(t)));
rho=0.5;
%3�������ϵ��
ksi=((mmin+rho*mmax)./(abs(t)+rho*mmax));

%4���������
ksi_column_num=size(ksi,2);
r=sum(ksi,2)/ksi_column_num;

%5�����������򣬵õ����r3>r2>r1
[rs,rind]=sort(r,'descend');
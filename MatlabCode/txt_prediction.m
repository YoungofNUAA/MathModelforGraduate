load all_X.mat;
load all_Y.mat;
load allD.mat
data_test = importdata('test.txt');
data_test1 = data_test(1:180,1)
data_pre = importdata('pre.txt');
for i=1:length(data_pre)
   if data_pre(i)>mean(data_pre)
       data_pre(i)=data_pre(i)+5;
   else
       data_pre(i)=data_pre(i)-5;
   end
end
% figure(1)
% plot(data_test1,'--ob')
% hold on
% plot(data_pre,'--*r')

figure(1)
plot(allD(1:180,1),data_pre)
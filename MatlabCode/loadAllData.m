fileList = ls('C:\Users\Young\Desktop\train_set');
AllData = cell(1,4000);
for i=1:4000
    data = importdata(strcat('C:\Users\Young\Desktop\train_set',strcat('\',fileList(i+2,:))));
    AllData{1,i} = data.data;
end

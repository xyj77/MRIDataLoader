%% 人工筛选层面比较多的肿瘤样本，平移offset个层面添加样本

clear,clc;
add(1).patientNo = '00190415'; add(1).d = [-45, -35]; add(1).offset = -3; add(1).tumour= 3;  
add(1).tumourNo = 1; add(1).Level = 3;  add(1).Edmondson = 1; %6

add(2).patientNo = '00431620'; add(2).d = [50, 55]; add(2).offset = -5; add(2).tumour = 1;  
add(2).tumourNo = 1; add(2).Level = 2;  add(2).Edmondson = 3; %8 面积很大

add(3).patientNo = '00431620'; add(3).d = [50, 55]; add(3).offset = 5; add(3).tumour = 2;  
add(3).tumourNo = 1; add(3).Level = 2;  add(3).Edmondson = 3; %8 面积很大

add(4).patientNo = '02170343';  add(4).d = [-60, 25]; add(4).offset = 8; add(4).tumour = 4;
add(4).tumourNo = 1; add(4).Level = 1;  add(4).Edmondson = 3; %25

add(5).patientNo = '00758688';  add(5).d = [60, 0]; add(5).offset = -5; add(5).tumour = 1;
add(5).tumourNo = 1; add(5).Level = 2;  add(5).Edmondson = 3; %12

add(6).patientNo = '00758688';  add(6).d = [60, 0]; add(6).offset = 4; add(6).tumour = 2;
add(6).tumourNo = 1; add(6).Level = 2;  add(6).Edmondson = 3; %12

add(7).patientNo = '02170343';  add(7).d = [-60, 25]; add(7).offset = -4; add(7).tumour = 1;
add(7).tumourNo = 1; add(7).Level = 1;  add(7).Edmondson = 3; %25

add(8).patientNo = '02170343';  add(8).d = [-60, 25]; add(8).offset = -8; add(8).tumour = 2;
add(8).tumourNo = 1; add(8).Level = 1;  add(8).Edmondson = 3; %25

add(9).patientNo = '02170343';  add(9).d = [-60, 25]; add(9).offset = 4; add(9).tumour = 3;
add(9).tumourNo = 1; add(9).Level = 1;  add(9).Edmondson = 3; %25


save('../add.mat', 'add');
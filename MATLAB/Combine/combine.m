clear,clc;
load '../labels.mat';
load '../available.mat';
figure,
% dataPath = '../ReadBBox/ResizeAug32/';
dataPath = '../ReadBBox/ArroundAug/';
% dataPath = '../ReadBBox/CoreAug/';
savePath = 'Input/';
classType = 'WHO';
% classType = 'Edmondson';

for i=1:length(available)
    disp(available(i).patientNo);    
    data_Structure(dataPath, savePath, labels, available(i), classType);
end

% Ìí¼ÓÑù±¾
load '../add.mat';
for i=1:length(add)
    disp(add(i).patientNo);
    data_Structure(dataPath, savePath, labels, add(i), classType);
end
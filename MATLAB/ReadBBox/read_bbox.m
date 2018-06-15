clear,clc;
load '../available.mat'
load '../labels.mat'
data_path = 'Mat/';

figure;
for i=1:length(available)
    disp(available(i).patientNo);
%     read_region(data_path, labels, available(i), 'orginal', 0);% 保留原始大小
%     read_region(data_path, labels, available(i), 'orginal', 1);% 保留原始大小
%     read_region(data_path, labels, available(i), 'resize', 0); % 尺寸归一化
%     read_region(data_path, labels, available(i), 'resize', 1); % 尺寸归一化
%     read_region(data_path, labels, available(i), 'core', 0);   % 截取中心区域
%     read_region(data_path, labels, available(i), 'core', 1);   % 截取中心区域
    read_region(data_path, labels, available(i), 'arround', 0);   % 标记区域周边若干像素
    read_region(data_path, labels, available(i), 'arround', 1);   % 标记区域周边若干像素
    disp('**********************');
end
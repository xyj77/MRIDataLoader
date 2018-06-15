clear;clc;
if exist('img_info.txt','file')
    fid = fopen('img_info.txt','w');
%     fprintf(fid, '文件名 病人编号 序列号 窗位 窗宽 高 宽 面积 肿瘤位置[l,u,r,d] 层厚\n');
    fprintf(fid, '');
    fclose(fid);
end

%% 读取图片中的标注信息，存入img_info.txt
path = 'label_img\';
file=dir( path );
for i=3:length(file)
     read_text(path, file(i).name);
     pause(0.02);
end

%% 合并标签信息
labels = merge_info('img_info.txt', 'excel_info.txt');
save('../labels.mat', 'labels');
%% 读取标记图像肿瘤区域
% read_Region('label_img\', 'label.txt');

%% 载入可用图像列表
avail;




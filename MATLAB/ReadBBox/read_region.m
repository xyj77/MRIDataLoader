function read_region(data_path, labels, available, type, isAug)
%READ_MAT 此处显示有关此函数的摘要
%   此处显示详细说明
if strcmp('orginal', type)
    if isAug
        save_path = 'BboxAug/';
    else
        save_path = 'Bbox/';
    end
elseif strcmp('resize', type)
    if isAug
        save_path = 'ResizeAug32/';
    else
        save_path = 'Resize32/';
    end
    save_size = 32;
elseif strcmp('core', type)
    if isAug
        save_path = 'CoreAug/';
    else
        save_path = 'Core/';
    end
    save_size = 16;
elseif strcmp('arround', type)
    if isAug
        save_path = 'ArroundAug/';
    else
        save_path = 'Arround/';
    end
    border = 1.2;
    save_size = 40;
end

patientNo = available.patientNo;
tumourNo = available.tumourNo;
savePath = [save_path patientNo];
dataPath = [data_path patientNo];
info = read_Info(patientNo, tumourNo, labels);
if ~exist(savePath, 'dir') 
   mkdir(savePath);  % 若不存在，在当前目录中产生一个子目录
end
if ~exist([savePath '_neg'], 'dir') 
   mkdir([savePath '_neg']);  % 若不存在，在当前目录中产生一个子目录
end

% 读取Mat数据
d = available.d;
data_dir = dir(dataPath);
for i=3:length(data_dir)
    Z = data_dir(i).name(1);
    Center = info(Z-'A'+1).Center;
    Size = info(Z-'A'+1).mean_Size;
    Location = info(Z-'A'+1).Location;
    if ~isempty(Center)

        if strcmp('arround', type)  % type为‘arround’时，向外扩展border倍
            % 向外扩展border倍
            Size = Size * border;
        end
        box = [Center(1)-floor(Size(1)/2), Center(1)+floor(Size(1)/2);
               Center(2)-floor(Size(2)/2), Center(2)+floor(Size(2)/2);
               Location(5), Location(6)]; 
        load([dataPath '/' data_dir(i).name]);
        T = D(box(1,1):box(1,2), box(2,1):box(2,2), box(3,1):box(3,2));
        T_neg = D(box(1,1)+d(1):box(1,2)+d(1), box(2,1)+d(2):box(2,2)+d(2), box(3,1):box(3,2));
        if strcmp('resize', type) || strcmp('arround', type)  % type为‘resize’时，尺度归一化
            T = mat_resize(T, save_size);         % 尺度归一化
            T_neg = mat_resize(T_neg, save_size); % 尺度归一化
        end
        if strcmp('core', type)  % type为‘core’时，截取中心区域
            T = mat_core(T, save_size);         % 截取中心区域
            T_neg = mat_core(T_neg, save_size); % 截取中心区域
        end
        
       %% *********数据扩容****************************
        if isAug
            T_aug = mat_augmentation(T);
            T_neg_aug = mat_augmentation(T_neg);
            mat_save([savePath '/' Z num2str(tumourNo)], T_aug)
            mat_save([savePath '_neg/' Z num2str(tumourNo)], T_neg_aug)
        end
       %% *******************************************
        
        check_data(D, T, T_neg, box, d, info, Z, Center);
        save([savePath '/' Z num2str(tumourNo)], 'T');
        T = T_neg;
        save([savePath '_neg/' Z num2str(tumourNo)], 'T');
    end
end
end

function info = read_Info(patientNo, tumourNo, labels)
% A:1 B:2 C:3 D:4 E:5 F:6 G:7 H:8 I:9 J:10 K:B2:11
for i=1:length(labels)
    if strcmp(labels(i).patientNo, patientNo) && labels(i).tumourNo == tumourNo
        Z = labels(i).modalNo;
        switch Z
          case 'A'
              info(1) = labels(i);
          case 'B'
              info(2) = labels(i);
              info(11) = labels(i);
          case 'C'
              info(3) = labels(i);
          case 'D'
              info(4) = labels(i);
          case 'E'
              info(5) = labels(i);
          case 'F'
              info(6) = labels(i);
          case 'G'
              info(7) = labels(i);
          case 'H'
              info(8) = labels(i);
          case 'I'
              info(9) = labels(i);
          case 'J'
              info(10) = labels(i);
        end
    end
end
end
function Y = mat_resize(X, save_size)
Y =zeros(save_size, save_size, size(X,3));
for i=1:size(X,3)
    Y(:,:,i) = imresize(X(:,:,i), [save_size, save_size], 'bicubic'); % 方法一：直接resize
end
end
function Y = mat_core(X, save_size)
center = [floor(size(X,1)/2), floor(size(X,2)/2)];
Y = X(center(1)-save_size/2+1:center(1)+save_size/2,...
      center(2)-save_size/2+1:center(2)+save_size/2,:); % 截取中心区域
end
function R_aug = mat_augmentation(R)
for i=1:size(R,3)
%     R_aug.T(i) = R(i);                            % 原始图
    R_aug.T_90(:,:,i) = rot90(R(:,:,i), 1);               % 逆时针90度
    R_aug.T_180(:,:,i) = rot90(R(:,:,i), 2);              % 逆时针180度
    R_aug.T_270(:,:,i) = rot90(R(:,:,i), 3);              % 逆时针270度
    R_aug.T_lr(:,:,i) = fliplr(R(:,:,i));                 % 左右翻转
    R_aug.T_ud(:,:,i) = flipud(R(:,:,i));                 % 上下翻转
    R_aug.T_tr(:,:,i) = R(:,:,i)';                        % 转置
    R_aug.T_tr2(:,:,i) = fliplr(fliplr(R(:,:,i))');       % 副对角线转置
end
end
function mat_save(savePath, Positive)
T = Positive.T_90;
save([savePath '_90.mat'], 'T');
T = Positive.T_180;
save([savePath '_180.mat'], 'T');
T = Positive.T_270;
save([savePath '_270.mat'], 'T');
T = Positive.T_lr;
save([savePath '_lr.mat'], 'T');
T = Positive.T_ud;
save([savePath '_ud.mat'], 'T');
T = Positive.T_tr;
save([savePath '_tr.mat'], 'T');
T = Positive.T_tr2;
save([savePath '_tr2.mat'], 'T');
end

function check_data(D, T, T_neg, box, d, info, Z, Center)
for i=1:box(3,2)-box(3,1)+1
    subplot(1,3,1),imshow(D(:,:,box(3,1)+i-1)),title(info(1).patientNo);
    hold on,rectangle('Position',[box(2,1),box(1,1),box(2,2)-box(2,1),box(1,2)-box(1,1)],'EdgeColor','r'),...
        rectangle('Position',[box(2,1)+d(2),box(1,1)+d(1),box(2,2)-box(2,1),box(1,2)-box(1,1)],'EdgeColor','g'),...
        rectangle('Position',[Center(2)-7,Center(1)-7,16,16],'EdgeColor','b'),hold off;
    subplot(1,3,2),imshow(T(:,:,i)),title([Z num2str(info(1).tumourNo)]);
    subplot(1,3,3),imshow(T_neg(:,:,i)),title([num2str(i) ' ' num2str(box(3,1)+i-1)]);
    pause(0.01)
end
end
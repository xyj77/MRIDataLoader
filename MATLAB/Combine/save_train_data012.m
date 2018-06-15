function save_train_data012(savePath, path, Info, available)
if ~exist(savePath,'dir') 
   mkdir(savePath);  % 若不存在，在当前目录中产生一个子目录
end

% structure0(savePath, path, Info); %第0种数据结构：单模态单片----64x64
% structure0_pic(savePath, path, Info); %第0种数据结构：单模态图片
% structure1_pic(savePath, path, Info); %第1种数据结构：多模态单片----64x64x3
% structure1(savePath, path, Info); %第1种数据结构：多模态单片----64x64x3 
% structure2(savePath, path, Info); %第2种数据结构：多模态单片----64x64x6
% structure3(savePath, path, Info); %第3种数据结构：单模态立体----64x64x5  
% structure4(savePath, path, Info); %第4种数据结构：多模态立体----64x64x5x4
structure5(savePath, path, Info, available); %第5种数据结构：多模态单片立体混合----32x32x(9+5x6+5+5x5)
end

%% 第0种数据结构：单模态单片----64x64
function structure0(savePath, path, Info)
info = Info(1);
tag = info.Level;
M = {['A' num2str(info.tumourNo)]};
M_90 = {[M{1} '_90']};
M_180 = {[M{1} '_180']};
M_270 = {[M{1} '_270']};
M_lr = {[M{1} '_lr']};
M_ud = {[M{1} '_ud']};
M_tr = {[M{1} '_tr']};
M_tr2 = {[M{1} '_tr2']};
N = M{1}(1) - 'A' +1;

P = combine(path, M, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
P = combine(path, M_90, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
P = combine(path, M_180, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
P = combine(path, M_270, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
P = combine(path, M_lr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
P = combine(path, M_ud, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
P = combine(path, M_tr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
P = combine(path, M_tr2, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');

% P = combine_diff(path, M, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
% P = combine_diff(path, M_90, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
% P = combine_diff(path, M_180, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
% P = combine_diff(path, M_270, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
% P = combine_diff(path, M_lr, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
% P = combine_diff(path, M_ud, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
% P = combine_diff(path, M_tr, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
% P = combine_diff(path, M_tr2, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');

end
function structure0_pic(savePath, path, Info)
info = Info(5);
tag = info.Level;
M = {['E' num2str(info.tumourNo)]};
M_90 = {[M{1} '_90']};
M_180 = {[M{1} '_180']};
M_270 = {[M{1} '_270']};
M_lr = {[M{1} '_lr']};
M_ud = {[M{1} '_ud']};
M_tr = {[M{1} '_tr']};
M_tr2 = {[M{1} '_tr2']};
N = M{1}(1) - 'A' +1;

P = combine(path, M, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.png']);
P = combine(path, M_90, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.png']);
P = combine(path, M_180, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.png']);
P = combine(path, M_270, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.png']);
P = combine(path, M_lr, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.png']);
P = combine(path, M_ud, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.png']);
P = combine(path, M_tr, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.png']);
P = combine(path, M_tr2, N, Info);
imwrite(P, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.png']);

end

%% 第一种数据结构：3种模态E、G、J，单片----64x64x3
function structure1_pic(savePath, path, Info)
info = Info(5);
tag = info.Level;
M = {['E' num2str(info.tumourNo)], ['F' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)]};
for i=1:length(M)
    M_90{i} = [M{i} '_90'];
    M_180{i} = [M{i} '_180'];
    M_270{i} = [M{i} '_270'];
    M_lr{i} = [M{i} '_lr'];
    M_ud{i} = [M{i} '_ud'];
    M_tr{i} = [M{i} '_tr'];
    M_tr2{i} = [M{i} '_tr2'];
    N(i) = M{i}(1) - 'A' +1;
end
P = combine(path, M, N, Info);
P_90 = combine(path, M_90, N, Info);
P_180 = combine(path, M_180, N, Info);
P_270 = combine(path, M_270, N, Info);
P_lr = combine(path, M_lr, N, Info);
P_ud = combine(path, M_ud, N, Info);
P_tr = combine(path, M_tr, N, Info);
P_tr2 = combine(path, M_tr2, N, Info);

%减去平扫
% P = combine_diff(path, M, N, Info);
% P_90 = combine_diff(path, M_90, N, Info);
% P_180 = combine_diff(path, M_180, N, Info);
% P_270 = combine_diff(path, M_270, N, Info);
% P_lr = combine_diff(path, M_lr, N, Info);
% P_ud = combine_diff(path, M_ud, N, Info);
% P_tr = combine_diff(path, M_tr, N, Info);
% P_tr2 = combine_diff(path, M_tr2, N, Info);

name = [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.png'];
imwrite(P, name);
imwrite(P_90, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.png']);
imwrite(P_180, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.png']);
imwrite(P_270, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.png']);
imwrite(P_lr, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.png']);
imwrite(P_ud, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.png']);
imwrite(P_tr, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.png']);
imwrite(P_tr2, [savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.png']);
end
function structure1(savePath, path, Info)
info = Info(5);
tag = info.Level;
M = {['G' num2str(info.tumourNo)], ['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)]};
for i=1:length(M)
    M_90{i} = [M{i} '_90'];
    M_180{i} = [M{i} '_180'];
    M_270{i} = [M{i} '_270'];
    M_lr{i} = [M{i} '_lr'];
    M_ud{i} = [M{i} '_ud'];
    M_tr{i} = [M{i} '_tr'];
    M_tr2{i} = [M{i} '_tr2'];
    N(i) = M{i}(1) - 'A' +1;
end
P = combine(path, M, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
P = combine(path, M_90, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
P = combine(path, M_180, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
P = combine(path, M_270, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
P = combine(path, M_lr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
P = combine(path, M_ud, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
P = combine(path, M_tr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
P = combine(path, M_tr2, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');

%减去平扫
% P = combine_diff(path, M, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
% P = combine_diff(path, M_90, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
% P = combine_diff(path, M_180, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
% P = combine_diff(path, M_270, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
% P = combine_diff(path, M_lr, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
% P = combine_diff(path, M_ud, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
% P = combine_diff(path, M_tr, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
% P = combine_diff(path, M_tr2, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');

end

%% 第二种数据结构:六种模态A、B、E、G、H、I，单片----64x64x6
function structure2(savePath, path, Info)
info = Info(5);
tag = info.Level;
% M = {['A' num2str(info.tumourNo)], ['E' num2str(info.tumourNo)],...
%     ['G' num2str(info.tumourNo)], ['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)]};

M = {['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]};


% M = {['A' num2str(info.tumourNo)], ['B' num2str(info.tumourNo)], ['E' num2str(info.tumourNo)],...
%     ['F' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)], ['H' num2str(info.tumourNo)],...
%     ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)], ['K' num2str(info.tumourNo)]}; %all

% M = {['A' num2str(info.tumourNo)], ['B' num2str(info.tumourNo)], ['E' num2str(info.tumourNo)],...
%     ['F' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)], ['H' num2str(info.tumourNo)],...
%     ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]}; %(1)ABEFGHIJ
% M = {['A' num2str(info.tumourNo)], ['E' num2str(info.tumourNo)],['F' num2str(info.tumourNo)],...
%     ['G' num2str(info.tumourNo)], ['H' num2str(info.tumourNo)],...
%     ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]}; %(2)AEFGHIJ
% M = {['A' num2str(info.tumourNo)], ['B' num2str(info.tumourNo)], ...
%     ['F' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)], ['H' num2str(info.tumourNo)],...
%     ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]}; %(3)ABFGHIJ

for i=1:length(M)
    M_90{i} = [M{i} '_90'];
    M_180{i} = [M{i} '_180'];
    M_270{i} = [M{i} '_270'];
    M_lr{i} = [M{i} '_lr'];
    M_ud{i} = [M{i} '_ud'];
    M_tr{i} = [M{i} '_tr'];
    M_tr2{i} = [M{i} '_tr2'];
    N(i) = M{i}(1) - 'A' +1;
end
P = combine(path, M, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
P = combine(path, M_90, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
P = combine(path, M_180, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
P = combine(path, M_270, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
P = combine(path, M_lr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
P = combine(path, M_ud, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
P = combine(path, M_tr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
P = combine(path, M_tr2, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');
end

%% 第三种数据结构:单模态立体----64x64x5
function structure3(savePath, path, Info)
info = Info(5);
tag = info.Level;
M = {['J' num2str(info.tumourNo)]};
for i=1:length(M)
    M_90{i} = [M{i} '_90'];
    M_180{i} = [M{i} '_180'];
    M_270{i} = [M{i} '_270'];
    M_lr{i} = [M{i} '_lr'];
    M_ud{i} = [M{i} '_ud'];
    M_tr{i} = [M{i} '_tr'];
    M_tr2{i} = [M{i} '_tr2'];
    N(i) = M{i}(1) - 'A' +1;
end
% P = combine_volume(path, M, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
% P = combine_volume(path, M_90, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
% P = combine_volume(path, M_180, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
% P = combine_volume(path, M_270, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
% P = combine_volume(path, M_lr, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
% P = combine_volume(path, M_ud, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
% P = combine_volume(path, M_tr, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
% P = combine_volume(path, M_tr2, N, Info);
% save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');

P = combine_volume_diff(path, M, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
P = combine_volume_diff(path, M_90, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
P = combine_volume_diff(path, M_180, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
P = combine_volume_diff(path, M_270, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
P = combine_volume_diff(path, M_lr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
P = combine_volume_diff(path, M_ud, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
P = combine_volume_diff(path, M_tr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
P = combine_volume_diff(path, M_tr2, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');

end

%% 第四种数据结构:多模态EGHI立体----64x64x5x4
function structure4(savePath, path, Info)
info = Info(5);
tag = info.Level;
M = {['E' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]}; %(1)

% M = {['E' num2str(info.tumourNo)], ['F' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)],...
%     ['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]}; %(1)
% M = {['E' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)], ['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)]};%(2)
% M = {['E' num2str(info.tumourNo)], ['F' num2str(info.tumourNo)]}; %(3)
% M = {['E' num2str(info.tumourNo)], ['F' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)]}; %(4)
% M = {['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)]}; %(5)
% M = {['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]}; % (6)

for i=1:length(M)
    M_90{i} = [M{i} '_90'];
    M_180{i} = [M{i} '_180'];
    M_270{i} = [M{i} '_270'];
    M_lr{i} = [M{i} '_lr'];
    M_ud{i} = [M{i} '_ud'];
    M_tr{i} = [M{i} '_tr'];
    M_tr2{i} = [M{i} '_tr2'];
    N(i) = M{i}(1) - 'A' +1;
end
P = combine_volume(path, M, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');
P = combine_volume(path, M_90, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');
P = combine_volume(path, M_180, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');
P = combine_volume(path, M_270, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');
P = combine_volume(path, M_lr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');
P = combine_volume(path, M_ud, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');
P = combine_volume(path, M_tr, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');
P = combine_volume(path, M_tr2, N, Info);
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');

end

%% 第五种数据结构：多模态单片立体混合---32x32x(9+5x6)
function structure5(savePath, path, Info, available)
info = Info(5);
tag = info.Level;
if isfield(available, 'offset')
    numb = info.tumourNo - available.tumour;
else
    numb = info.tumourNo;
end
M_2D = {['A' num2str(numb)],...
    ['B' num2str(numb)],...
    ['K' num2str(numb)],...
    ['E' num2str(numb)],... 
    ['F' num2str(numb)],... 
    ['G' num2str(numb)],...
    ['H' num2str(numb)],... 
    ['I' num2str(numb)],... 
    ['J' num2str(numb)]}; 
M_3D = {['E' num2str(numb)],...
    ['F' num2str(numb)],...
    ['G' num2str(numb)],...
    ['H' num2str(numb)],...
    ['I' num2str(numb)],...
    ['J' num2str(numb)]}; 
for i=1:length(M_2D)
    M_2D_90{i} = [M_2D{i} '_90'];
    M_2D_180{i} = [M_2D{i} '_180'];
    M_2D_270{i} = [M_2D{i} '_270'];
    M_2D_lr{i} = [M_2D{i} '_lr'];
    M_2D_ud{i} = [M_2D{i} '_ud'];
    M_2D_tr{i} = [M_2D{i} '_tr'];
    M_2D_tr2{i} = [M_2D{i} '_tr2'];
    N_2D(i) = M_2D{i}(1) - 'A' +1;
end
for i=1:length(M_3D)
    M_3D_90{i} = [M_3D{i} '_90'];
    M_3D_180{i} = [M_3D{i} '_180'];
    M_3D_270{i} = [M_3D{i} '_270'];
    M_3D_lr{i} = [M_3D{i} '_lr'];
    M_3D_ud{i} = [M_3D{i} '_ud'];
    M_3D_tr{i} = [M_3D{i} '_tr'];
    M_3D_tr2{i} = [M_3D{i} '_tr2'];
    N_3D(i) = M_3D{i}(1) - 'A' +1;
end

% M_diff = {['F' num2str(info.tumourNo)], ['G' num2str(info.tumourNo)],...
%     ['H' num2str(info.tumourNo)], ['I' num2str(info.tumourNo)], ['J' num2str(info.tumourNo)]}; 
% for i=1:length(M_diff)
%     M_diff_90{i} = [M_diff{i} '_90'];
%     M_diff_180{i} = [M_diff{i} '_180'];
%     M_diff_270{i} = [M_diff{i} '_270'];
%     M_diff_lr{i} = [M_diff{i} '_lr'];
%     M_diff_ud{i} = [M_diff{i} '_ud'];
%     M_diff_tr{i} = [M_diff{i} '_tr'];
%     M_diff_tr2{i} = [M_diff{i} '_tr2'];
%     N_diff(i) = M_diff{i}(1) - 'A' +1;
% end

P_2D = combine(path, M_2D, N_2D, Info);
P_3D = combine_3D(path, M_3D, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '.mat'], 'P');

P_2D = combine(path, M_2D_90, N_2D, Info);
P_3D = combine_3D(path, M_3D_90, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff_90, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff_90, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_90.mat'], 'P');

P_2D = combine(path, M_2D_180, N_2D, Info);
P_3D = combine_3D(path, M_3D_180, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff_180, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff_180, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_180.mat'], 'P');

P_2D = combine(path, M_2D_270, N_2D, Info);
P_3D = combine_3D(path, M_3D_270, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff_270, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff_270, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_270.mat'], 'P');

P_2D = combine(path, M_2D_lr, N_2D, Info);
P_3D = combine_3D(path, M_3D_lr, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff_lr, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff_lr, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_lr.mat'], 'P');

P_2D = combine(path, M_2D_ud, N_2D, Info);
P_3D = combine_3D(path, M_3D_ud, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff_ud, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff_ud, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_ud.mat'], 'P');

P_2D = combine(path, M_2D_tr, N_2D, Info);
P_3D = combine_3D(path, M_3D_tr, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff_tr, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff_tr, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr.mat'], 'P');

P_2D = combine(path, M_2D_tr2, N_2D, Info);
P_3D = combine_3D(path, M_3D_tr2, N_3D, Info);
% P_2D_diff = combine_diff(path, M_diff_tr2, N_diff, Info);
% P_3D_diff = combine_3D_diff(path, M_diff_tr2, N_diff, Info);
P(:,:,1:9) = P_2D; P(:,:,10:39) = P_3D;
% P(:,:,40:44) = P_2D_diff; P(:,:,45:69) = P_3D_diff;
save([savePath info.patientNo num2str(info.tumourNo) num2str(tag) '_tr2.mat'], 'P');
end

%% utils
function P = combine(path, M, N, Info)
for i=1:length(M)
    load([path M{i} '.mat']);
    mid = Info(N(i)).serNo - Info(N(i)).Location(5)+1;
    P(:,:,i) = T(:,:,mid);
    imshow(T(:,:,mid)),...
        title([Info(N(i)).patientNo, Info(N(i)).modalNo]);
    pause(0.02);
end
% imshow(P(:, :, 1:3));
% pause(0.05);
end
function P = combine_diff(path, M, N, Info)
for i=1:length(M)
    E = load([path 'E' M{i}(2:length(M{i}))]);
    E = E.T(:,:,Info(5).serNo - Info(5).Location(5)+1);
    mid = Info(N(i)).serNo - Info(N(i)).Location(5)+1;    
    T = load([path M{i} '.mat']);
    T = T.T(:,:,mid);
    P(:,:,i) = (T-E)./E;
    imshow(P(:,:,i)),...
        title([Info(N(i)).patientNo, Info(N(i)).modalNo]);
    pause(0.02);
end
end
function P = combine_volume(path, M, N, Info)
for i=1:length(M)
    load([path M{i} '.mat']);
    mid = Info(N(i)).serNo - Info(N(i)).Location(5)+1;
    P(:,:,:,i) = T(:,:,mid-2:mid+2);
    imshow(T(:, :, 2:4)), title([Info(N(i)).patientNo, Info(N(i)).modalNo]);
    pause(0.05);
end
end
function P = combine_volume_diff(path, M, N, Info)
for i=1:length(M)
    E = load([path 'E' M{i}(2:length(M{i}))]);
    E = E.T(:,:,(Info(5).serNo - Info(5).Location(5)+1)-2:(Info(5).serNo - Info(5).Location(5)+1)+2);
    mid = Info(N(i)).serNo - Info(N(i)).Location(5)+1;
    T = load([path M{i} '.mat']);
    T = T.T(:,:,mid-2:mid+2);
    S = (T-E)./E;
    P(:,:,:,i) = S;
    imshow(S(:,:,2:4)),...
        title([Info(N(i)).patientNo, Info(N(i)).modalNo]);
    pause(0.02);
end
end
function P = combine_3D(path, M, N, Info)
for i=1:length(M)
    load([path M{i} '.mat']);
    mid = Info(N(i)).serNo - Info(N(i)).Location(5)+1;
    P(:,:,i*5-4:i*5) = T(:,:,mid-2:mid+2);
    imshow(T(:, :, mid-1:mid+1)), title([Info(N(i)).patientNo, Info(N(i)).modalNo]);
    pause(0.02);
end
end
function P = combine_3D_diff(path, M, N, Info)
for i=1:length(M)
    E = load([path 'E' M{i}(2:length(M{i}))]);
    E = E.T(:,:,(Info(5).serNo - Info(5).Location(5)+1)-2:(Info(5).serNo - Info(5).Location(5)+1)+2);
    load([path M{i} '.mat']);
    mid = Info(N(i)).serNo - Info(N(i)).Location(5)+1;
    T = T(:,:,mid-2:mid+2);
    S = (T-E)./E;
    P(:,:,i*5-4:i*5) = S;
    imshow(S(:, :, 2:4)), title([Info(N(i)).patientNo, Info(N(i)).modalNo]);
    pause(0.02);
end
end

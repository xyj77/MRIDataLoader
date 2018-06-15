clear,clc;
% load '../available.mat'
% data_path = 'Complete/';
% save_path = 'Mat/';
% 
% for i=1:length(available)
%     disp(available(i).patientNo);
%     normal_data(data_path, save_path, available(i).patientNo);
%     disp('**********************');
% end

%% 验证归一化结果
figure;
data_path = 'Mat/';
data_dir = dir(data_path);
for i=3:length(data_dir)
    if data_dir(i).isdir
        sub_dir = dir([data_path data_dir(i).name]);
        for j=3:length(sub_dir)
            load([sub_dir(j).folder '/' sub_dir(j).name]);
            for k=1:size(D,3)
                imshow(D(:,:,k));
                title([sub_dir(j).name ' ' num2str(k)]);
                pause(0.05);
            end
        end
    end
end
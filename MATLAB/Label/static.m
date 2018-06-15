clear,clc;
%**************************************************************************
%             A  B  C  D  E  F  G  H  I  J
% 04154248  

num = 1;patient = [];
S_img = {'Image', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
fid_img = fopen('img_info.txt','r');
while feof(fid_img) ~= 1
    line = fgetl(fid_img); 
    if ~strcmp(patient, line(1:10))
        num = num +1;
        patient = line(1:10);
        S_img{num, 1} = patient;
        S_img = mark(num, line(12), S_img);
    else
        S_img = mark(num, line(12), S_img);
    end
 end  
fclose(fid_img);

num = 1;patient = [];
S_excel = {'Excel', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
fid_excel = fopen('excel_info.txt','r');
while feof(fid_excel) ~= 1
    line = fgetl(fid_excel); 
    if ~strcmp(patient, line(1:10))
        num = num +1;
        patient = line(1:10);
        S_excel{num, 1} = patient;
        S_excel = mark(num, line(12), S_excel);
    else
        S_excel = mark(num, line(12), S_excel);
    end
 end  
fclose(fid_excel);

disp('***********************');
load 'C:\Users\lab304b\Documents\MATLAB\Medical Image\Liver\labels.mat';
num = 0;
for i=1:length(labels)
    if labels(i).serNo < labels(i).Location(5) || labels(i).serNo > labels(i).Location(6)
        disp([labels(i).patientNo ' ' num2str(labels(i).tumourNo) ' ' labels(i).modalNo]);
        num = num + 1;
    end
end
disp([num2str(num) '例serNo不在肿瘤层范围之间!']);

disp('***********************');
num = 0;
for i=1:length(labels)
    if labels(i).serNo - labels(i).Location(5) < 2 || labels(i).Location(6) - labels(i).serNo < 2
        disp([labels(i).patientNo ' ' num2str(labels(i).tumourNo) ' ' labels(i).modalNo]);
        num = num + 1;
    end
end
disp([num2str(num) '例最大层面两边不足两层!']);




disp('***********************');
j = 0;
for i=1:length(labels)
    if strcmp(labels(i).modalNo, 'E')
        j = j + 1;
        ply(j) = labels(i).Location(6)-labels(i).Location(5)+1;
        width(j) = labels(i).Location(3)-labels(i).Location(1)+1;
        hight(j) = labels(i).Location(4)-labels(i).Location(2)+1;
        txt(j) = num2cell(labels(i).Level); 
        if width(j) > 60 || hight(j) > 60
            disp(labels(i).patientNo);
        end
    end
end
disp(['肿瘤宽度或长度大于60像素的病例']);
% subplot(121),hist(width,8),title('肿瘤宽度');
% subplot(122),hist(ply,8),title('肿瘤层数');
% figure,bar(ply),title('纵向层数'),text(1:j, ply+0.5, txt);
% figure,bar(width),title('肿瘤尺寸'),text(1:j, width+1.5, txt);    

    




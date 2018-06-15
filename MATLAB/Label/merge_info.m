function labels = merge_info(img_info, excel_info)
% clear,clc;
% img_info = 'img_info.txt';
% excel_info = 'excel_info.txt';

if exist('label.txt','file')
    fid = fopen('label.txt','w');
    fprintf(fid, '');
    fclose(fid);
end
%% 将img_info.txt中的标签与Excel中标签excel_info.txt合并到label.txt
display('****************************');
fid=fopen('label.txt','a+');                %新建一个txt文件
fid_img = fopen(img_info,'r');
num = 0;
while feof(fid_img) ~= 1                    %用于判断文件指针p在其所指的文件中的位置，如果到文件末，函数返回1，否则返回0  
      img_l = fgetl(fid_img);               %获取文档第一行 
      flag = 0;
      fid_excel = fopen(excel_info,'r');
      while feof(fid_excel) ~= 1                     
          excel_l = fgetl(fid_excel);
          if(strcmp(img_l(1:12), excel_l(1:12)))
              fprintf(fid,'%s\n',[img_l ' [' excel_l(14:length(excel_l)-2) '] ' ...
                  excel_l(length(excel_l))]);%新的字符串写入当新建文档中 
              flag = 1;
%               display([img_l(1:12) ' Matching!']);
          end
      end
      fclose(fid_excel);
      
      if ~flag
%           fprintf(fid,'%s\n',img_l);
          display(img_l(1:12));
          num = num + 1;
      end
 end  
fclose(fid_img);
fclose(fid);
if num
    display([num2str(num) '例image有但excel没有!']);
else
    display('img有的excel都有！');
end

display('****************************');
fid_excel = fopen(excel_info,'r');
num = 0;
while feof(fid_excel) ~= 1
      excel_l = fgetl(fid_excel); 
      flag = 0;
      fid_img = fopen(img_info,'r');
      while feof(fid_img) ~= 1                     
          img_l = fgetl(fid_img);
          if(strcmp(img_l(1:12), excel_l(1:12)))
              flag = 1;
          end
      end
      fclose(fid_img);
      if ~flag
          display(excel_l(1:12));
          num = num + 1;
      end
 end  
fclose(fid_excel);
if num
    display([num2str(num) '例excel有但image没有!']);
else
    display('excel有的img都有！');
end
display('****************************');

%% 将标签存为结构体数据并保存
% 读取标签
fid=fopen('label.txt'); % open the txt
line_num=0;% line number when reading the txt file
while(~feof(fid))
    line_num=line_num+1;
    str_line=fgetl(fid); % get one line string
    index_comma=find(']'==str_line);
    str_line(index_comma)='';
    index_comma=find('['==str_line);
    str_line(index_comma)='';
    data = strsplit(str_line);
    labels(line_num).patientNo = data{1};
    labels(line_num).tumourNo = str2double(data{2});
    labels(line_num).modalNo = data{3};
    labels(line_num).serNo = str2double(data{4});
    labels(line_num).WL = str2double(data{5});
    labels(line_num).WW = str2double(data{6});
    labels(line_num).Ply = data{7};
%     labels(line_num).Hight = str2double(data{8});
%     labels(line_num).Width = str2double(data{9});
%     labels(line_num).Area = str2double(data{10});
    labels(line_num).Location = [str2double(data{11}) str2double(data{12}) str2double(data{13}) str2double(data{14})...
        str2double(data{15}) str2double(data{16})];
    labels(line_num).Level = str2double(data{17});
    labels(line_num).Center = [floor((str2double(data{11})+str2double(data{13}))/2), floor((str2double(data{12})+str2double(data{14}))/2), str2double(data{4})];
end
fclose(fid);

%% 读取错误改正：
for i=1:length(labels)
    % Add:
%     if strcmp(labels(i).patientNo, '00431620') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'E')
%         labels(i).serNo = 54; %00431620-1-E-NaN->54
%     end
    if strcmp(labels(i).patientNo, '00159253') && (labels(i).tumourNo == 2) && strcmp(labels(i).modalNo, 'C')
        labels(i).WW = 2400; %00159253-2-C-8-1300-NaN->2400
    end
    if strcmp(labels(i).patientNo, '00582685') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'F')
        labels(i).serNo = 53; %00582685-1-F-NaN->53
    end
    if strcmp(labels(i).patientNo, '02785957') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'C')
        labels(i).WW = 2637; %02785957-1-C-3-2147-NaN->2637
    end
    
    %以下是层数不够更改边界或者序列号
    if strcmp(labels(i).patientNo, '00190415') && (labels(i).tumourNo == 3) && strcmp(labels(i).modalNo, 'E')
        labels(i).Location(5) = 25; labels(i).Location(6) = 30; 
    end
    if strcmp(labels(i).patientNo, '01277361') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'J')
        labels(i).serNo = 32;
    end
    if strcmp(labels(i).patientNo, '01294892') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'F')
        labels(i).serNo = 28; 
    end
    if strcmp(labels(i).patientNo, '03374488') && (labels(i).tumourNo == 2) && strcmp(labels(i).modalNo, 'F')
        labels(i).Location(5) = 37; 
    end
    if strcmp(labels(i).patientNo, '04154248') && (labels(i).tumourNo == 2) && strcmp(labels(i).modalNo, 'I')
        labels(i).Location(5) = 27; 
    end
    if strcmp(labels(i).patientNo, '04196999') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'E')
        labels(i).serNo = 46; 
    end
    if strcmp(labels(i).patientNo, '07998836') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'F')
        labels(i).Location(5) = 64; labels(i).Location(6) = 69; 
    end
    if strcmp(labels(i).patientNo, '07998836') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'G')
        labels(i).Location(5) = 64; labels(i).Location(6) = 69; 
    end
    if strcmp(labels(i).patientNo, '00582685') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'G')
        labels(i).serNo = 53; 
    end
    % 20180111修改
    if strcmp(labels(i).patientNo, '00525849') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'E')
        labels(i).Location(5) = 36; labels(i).Location(6) = 40;
    end
    if strcmp(labels(i).patientNo, '00525849') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'F')
        labels(i).Location(6) = 38; 
    end
    if strcmp(labels(i).patientNo, '00525849') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'H')
        labels(i).Location(5) = 32; 
    end
    if strcmp(labels(i).patientNo, '00525849') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'I')
        labels(i).serNo = 35; 
    end
    if strcmp(labels(i).patientNo, '00090960') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'F')
        labels(i).Location(6) = 23; 
    end    
    if strcmp(labels(i).patientNo, '01508594') && (labels(i).tumourNo == 1) && strcmp(labels(i).modalNo, 'F')
        labels(i).serNo = 29; 
    end  
    if strcmp(labels(i).patientNo, '02720422') && (labels(i).tumourNo == 3) && strcmp(labels(i).modalNo, 'J')
        labels(i).serNo = 30; 
    end
    
end

% 保存各个模态平均肿瘤大小
mean_num = 0;
for i=1:length(labels)
    num_modal = 0;
    sum_Size = [0,0];    
    for j=1:length(labels)
        if strcmp([labels(i).patientNo labels(i).tumourNo],[labels(j).patientNo labels(j).tumourNo])
            num_modal = num_modal + 1;
            sum_Size = sum_Size + [labels(j).Location(3) - labels(j).Location(1), labels(j).Location(4) - labels(j).Location(2)];
        end
    end
    mean_num = mean_num + 1;
    labels(mean_num).patientNo = labels(i).patientNo;
    labels(mean_num).tumourNo = labels(i).tumourNo;
    labels(mean_num).mean_Size = floor(sum_Size ./ num_modal);
    labels(i).Center(3) = labels(i).serNo;
end

end




function data_Structure(dataPath, savePath, labels, available, classType)
patientNo = available.patientNo;
tumourNo = available.tumourNo;
Edmondson = available.Edmondson;
info = read_Info(patientNo, tumourNo, labels, available);
% 读取mat数据
data0123(dataPath, savePath, info, patientNo, classType, Edmondson, available);% 0123读取三种分化区域和背景
end

function data0123(dataPath, savePath, Info, patientNo, classType, Edmondson, available)
data_dir = dir(dataPath);
for i=3:length(data_dir)
    dir_name = data_dir(i).name;
    if data_dir(i).isdir && strcmp(patientNo, dir_name(1:8))
        path = [dataPath data_dir(i).name '/'];
        if strcmp(classType, 'WHO')
            if ~strcmp('_neg', dir_name(length(dir_name)-3:length(dir_name)))
                save_train_data012([savePath num2str(Info(5).Level-1) '/'], path, Info, available);%存成3类012
            else
                save_train_data012([savePath '3/'], path, Info, available);%保存背景
            end
        elseif strcmp(classType, 'Edmondson')
            if ~strcmp('_neg', dir_name(length(dir_name)-3:length(dir_name)))
                save_train_data012([savePath num2str(Edmondson-1) '/'], path, Info, available);%存成4类0123
            else
                save_train_data012([savePath '4/'], path, Info, available);%保存背景
            end
        end
    end
end
end
function info = read_Info(patientNo, tumourNo, labels, available)
% A:1 B:2 C:3 D:4 E:5 F:6 G:7 H:8 I:9 J:10 K:B2:11
for i=1:length(labels)
    if strcmp(labels(i).patientNo, patientNo) && labels(i).tumourNo == tumourNo
        label = labels(i);
        Z = labels(i).modalNo;
        if isfield(available, 'offset')
            label.tumourNo = label.tumourNo + available.tumour;
            if  Z>='E'
                label.serNo = label.serNo + available.offset;
            elseif ((label.serNo+sign(available.offset))>=label.Location(5)) && ...
                    ((label.serNo+sign(available.offset))<=label.Location(6))
                label.serNo = label.serNo+sign(available.offset);
            end
        end
        switch Z
          case 'A'
              info(1) = label;
          case 'B'
              info(2) = label;
              info(11) = label;
          case 'C'
              info(3) = label;
          case 'D'
              info(4) = label;
          case 'E'
              info(5) = label;
          case 'F'
              info(6) = label;
          case 'G'
              info(7) = label;
          case 'H'
              info(8) = label;
          case 'I'
              info(9) = label;
          case 'J'
              info(10) = label;
        end
    end
end
end



clear,clc;
available(1).patientNo = '04881647';  available(1).d = [-70, 50]; available(1).tumourNo = 1;available(1).Level = 2;  %65
available(2).patientNo = '04896314';  available(2).d = [-90, 100]; available(2).tumourNo = 1;available(2).Level = 2; %66
available(3).patientNo = '04881003';  available(3).d = [110, -10]; available(3).tumourNo = 1;available(3).Level = 2; %64
available(4).patientNo = '04875633';  available(4).d = [120, -70]; available(4).tumourNo = 1;available(4).Level = 2; %63 面积小
available(5).patientNo = '04196999';  available(5).d = [30, -40]; available(5).tumourNo = 1;available(5).Level = 2;  %61
available(6).patientNo = '04160396';  available(6).d = [80, 20]; available(6).tumourNo = 1;available(6).Level = 2;   %59 处在边缘
available(7).patientNo = '04156573';  available(7).d = [110, -140]; available(7).tumourNo = 1;available(7).Level = 3;%58 
available(8).patientNo = '04154248';  available(8).d = [90, -20]; available(8).tumourNo = 1;available(8).Level = 2;  %57 面积小
available(9).patientNo = '04154248';  available(9).d = [90, 0]; available(9).tumourNo = 2;available(9).Level = 3;    %57 面积小
available(10).patientNo = '00159253';  available(10).d = [30, -50]; available(10).tumourNo = 1;available(10).Level = 2;  %4 
available(11).patientNo = '00190415';  available(11).d = [-45, -35]; available(11).tumourNo = 1;available(11).Level = 3;  %6 长方形
available(12).patientNo = '00190415';  available(12).d = [0, -50]; available(12).tumourNo = 2;available(12).Level = 3;  %6
available(13).patientNo = '00190415';  available(13).d = [30, 0]; available(13).tumourNo = 3;available(13).Level = 3;  %6 层数少
available(14).patientNo = '00431620';  available(14).d = [50, 55]; available(14).tumourNo = 1;available(14).Level = 2;  %8 面积很大，删除对应负样本
available(15).patientNo = '00758688';  available(15).d = [60, 0]; available(15).tumourNo = 1;available(15).Level = 2;  %12
available(16).patientNo = '04917901';  available(16).d = [60, 15]; available(16).tumourNo = 1;available(16).Level = 2;  %67
available(17).patientNo = '04150722';  available(17).d = [110, -140]; available(17).tumourNo = 1;available(17).Level = 1;  %56
available(18).patientNo = '03929738';  available(18).d = [40, -20]; available(18).tumourNo = 1;available(18).Level = 2;  %54
available(19).patientNo = '03929738';  available(19).d = [50, 15]; available(19).tumourNo = 2;available(19).Level = 2;  %54
available(20).patientNo = '03904525';  available(20).d = [-55, -10]; available(20).tumourNo = 1;available(20).Level = 2;  %53
available(21).patientNo = '03872352';  available(21).d = [40, 0];available(21).tumourNo = 1;available(21).Level = 2;  %50 面积小
available(22).patientNo = '03374488';  available(22).d = [60, -80]; available(22).tumourNo = 1;available(22).Level = 2;  %41
available(23).patientNo = '03374488';  available(23).d = [60, 0]; available(23).tumourNo = 2;available(23).Level = 2;  %41
available(24).patientNo = '03136184';  available(24).d = [60, -200]; available(24).tumourNo = 1;available(24).Level = 1;  %36
available(25).patientNo = '02880023';  available(25).d = [-35, -30]; available(25).tumourNo = 1;available(25).Level = 3;  %31 质量不好
available(26).patientNo = '02720422';  available(26).d = [0, -80];available(26).tumourNo = 1;available(26).Level = 2; %29
available(27).patientNo = '02617637';  available(27).d = [40, 25]; available(27).tumourNo = 1;available(27).Level = 2; %27
available(28).patientNo = '02170343';  available(28).d = [-60, 25]; available(28).tumourNo = 1;available(28).Level = 1; %25
available(29).patientNo = '01699689';  available(29).d = [135, 0]; available(29).tumourNo = 1;available(29).Level = 2; %24
available(30).patientNo = '01277361';  available(30).d = [-40, -60]; available(30).tumourNo = 1;available(30).Level = 2; %19
available(31).patientNo = '00070993';  available(31).d = [0, -80]; available(31).tumourNo = 1;available(31).Level = 2; % part2-1 
available(32).patientNo = '00090960';  available(32).d = [80, 0]; available(32).tumourNo = 1;available(32).Level = 2; % part2-2
available(33).patientNo = '01110131';  available(33).d = [30, 0]; available(33).tumourNo = 1;available(33).Level = 3; % part2-4
available(34).patientNo = '01508594';  available(34).d = [-40, -10]; available(34).tumourNo = 1;available(34).Level = 2; % part2-7
available(35).patientNo = '02365411';  available(35).d = [-40, 10]; available(35).tumourNo = 1;available(35).Level = 1; % part2-8
available(36).patientNo = '03930451';  available(36).d = [70, -15]; available(36).tumourNo = 1;available(36).Level = 3; % part2-9 面积很大
available(37).patientNo = '04245741';  available(37).d = [40, 15]; available(37).tumourNo = 1;available(37).Level = 2; % part2-10
available(38).patientNo = '08149829';  available(38).d = [-80, 0]; available(38).tumourNo = 1;available(38).Level = 2; % part2-13
available(39).patientNo = '13195865';  available(39).d = [0, -50]; available(39).tumourNo = 1;available(39).Level = 2; % part2-16
available(40).patientNo = '13198521';  available(40).d = [-50, -50]; available(40).tumourNo = 1;available(40).Level = 2; % part2-17
available(41).patientNo = '13212676';  available(41).d = [55, 15]; available(41).tumourNo = 1;available(41).Level = 2; % part2-19
available(42).patientNo = '13213503';  available(42).d = [0, 50]; available(42).tumourNo = 1;available(42).Level = 3; % part2-20
available(43).patientNo = '13292381';  available(43).d = [-40, 0]; available(43).tumourNo = 1;available(43).Level = 2; % part2-21
available(44).patientNo = '00525849';  available(44).d = [0, 30]; available(44).tumourNo = 1;available(44).Level = 2; % part2-3_--
available(45).patientNo = '01327800';  available(45).d = [0, 40]; available(45).tumourNo = 1;available(45).Level = 1; % part2-5_--1
available(46).patientNo = '01327800';  available(46).d = [-20, 40]; available(46).tumourNo = 2;available(46).Level = 1; % part2-5_--2
available(47).patientNo = '01327800';  available(47).d = [-15, -40]; available(47).tumourNo = 3;available(47).Level = 1; % part2-5_--3
available(48).patientNo = '13202169';  available(48).d = [0, -45]; available(48).tumourNo = 1;available(48).Level = 2; % part2-18_--
available(49).patientNo = '13244170';  available(49).d = [0, -45]; available(49).tumourNo = 1;available(49).Level = 2; % part2-6_--
available(50).patientNo = '02720422';  available(50).d = [0, -80]; available(50).tumourNo = 2;available(50).Level = 2; %29 
available(51).patientNo = '02720422';  available(51).d = [10, -60]; available(51).tumourNo = 3;available(51).Level = 2; %29

%% 将标签存为结构体数据并保存
% 读取EdmondsonLabel标签
fid=fopen('EdmondsonLabel.txt'); 
line_num=0;% line number when reading the txt file
while(~feof(fid))
    line_num=line_num+1;
    str_line=fgetl(fid); % get one line string
    data = strsplit(str_line);
    patientNo = data{1};
    Edmondson = str2double(data{2});
    for i=1:length(available)
        if available(i).patientNo == patientNo
            available(i).Edmondson = Edmondson;
        end
    end
end
fclose(fid);

classes = zeros(3, 1);
for i=1:length(available)
    classes(available(i).Level) = classes(available(i).Level) + 1;
end
disp(classes);

save('../available.mat', 'available');

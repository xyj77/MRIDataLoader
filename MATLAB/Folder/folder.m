clear;clc;
oldPath = 'Data\';
newPath = 'SplitData\';
mkdir(newPath);
file=dir( oldPath );

for i=3:length(file) - 63
    newFolder = file(i).name(5:12);
    mkdir([newPath newFolder '_' num2str(i-2)]);
    subDir = dir([oldPath file(i).name]);
    pre = [];
    for j=3:length(subDir) - 1
        fileName = subDir(j).name;
        temp = regexp(fileName, '_', 'split');
%         current{j-2} = temp{4};
%         if(j==3)
%             addDir = [newPath newFolder '\' current{j-2}];
%             mkdir(addDir); 
%         elseif(current{j-2} ~= current{j-3})
%             addDir = [newPath newFolder '\' current{j-2}];
%             mkdir(addDir); 
%         end
%         copyfile([oldPath file(i).name '\' fileName],[newPath newFolder '\' current{j-2} '\' fileName]);

        current = temp{4};
        if(~strcmp(pre , current))
            addDir = [newPath newFolder '_' num2str(i-2) '\' current];
            mkdir(addDir); 
            pre = current;
        end
        copyfile([oldPath file(i).name '\' fileName],[newPath newFolder '_' num2str(i-2) '\' current '\' fileName]);
    end
    disp(['Rename ' newFolder '_' num2str(i-2) ' done!']);
end
disp('**************************');

% »®·ÖDCEÐòÁÐ
file=dir( newPath );
for i=3:length(file)
    sub = dir([newPath file(i).name]);
    for j=3:length(sub)
        subSub = dir([newPath file(i).name '\' sub(j).name]);
        if(length(subSub) >= 200)
            currentPath = [newPath file(i).name '\' sub(j).name];
            d = dir(currentPath);
            len = length(d);
            num = (len-2)/5;                
            s = 0;
            for k=3:len
                if(mod(k-3,num)==0)
                    mkdir([newPath file(i).name '\' sub(j).name '-' num2str((k-3)/num+1)]);
                    s = s+1;
                end
                movefile([currentPath '\' d(k).name],[currentPath '-' num2str(s) '\' d(k).name]);
            end
            rmdir(currentPath);   
            disp(['Divide ' file(i).name '-' sub(j).name ' done!']);
        end
    end
end






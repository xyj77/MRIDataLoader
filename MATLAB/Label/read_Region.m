function read_Region(imgPath, labelPath)
% imgPath = 'label_img\';
% labelPath = 'label.txt';
imgFile = dir(imgPath);

for i=3:length(imgFile)
    imgName = imgFile(i).name;
    fid = fopen(labelPath, 'r');
    while feof(fid) ~= 1 
        line = fgetl(fid);
        if strcmp(strrep(imgName(1:12), '-', ' '), line(1:12))
            I = imread([imgPath, imgName]);
            indexL = find('['==line);
            indexR = find(']'==line);
            s = regexp(line(indexL(1)+1:indexR(1)-1), ' ', 'split');
            u = str2num(s{1});d = str2num(s{3});l = str2num(s{2});r = str2num(s{4});
            h = d - u + 1; w = r - l + 1;
            c1 = floor(w/2) ; c2 = floor(h/2);
            subplot(121),imshow(I),title(imgName);
            subplot(122),imshow(I(u:d,l:r,:)),rectangle('Position',[c1-5, c2-5, 11, 11],'EdgeColor','b','LineWidth',1);
            pause(0.1);
        end
    end

    fclose(fid);
end

end
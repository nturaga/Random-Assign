function s = gctparse(filename)
%GCTPARSE Parse the gct file and seperate fields into structs

    %read the gct files
    fileCont = fileread(filename);

    %Skip the first two lines
    newLinePos = strfind(fileCont,sprintf('\n'));
    fileCont = fileCont(newLinePos(2)+1:end);

    %Make a temporary file so as not to touch the original file
    fid = fopen('tmp.txt','w');
    fwrite(fid,fileCont);
    fclose(fid);

    %Using importdata matlab function to get the data
    %as opposed to parsing the file
    gctData = importdata('tmp.txt');

    gn = gctData.textdata(:,2);
    gd = gctData.textdata(:,1);
    sid = gctData.textdata(1,:);
    ge = gctData.data;
    
    % Avoiding the row headings and create struct
    s = struct;
    s.ge = ge;
    s.gn = gn(2:end);
    s.gd = gd(2:end);
    s.sid = sid(3:end);

end



%Extract EKG files to vector
function [data_array,names]=ELEC301projEKGextract()


[data_array,names]=EKGfiles();

return

function [data_array,names]=EKGfiles()
%This function loads the data from .mat files in a directory of 
%your choice into a cell array. There is also a cell array of the names of each file.
%Each cell in the data_array contains the data from a .mat file in the form
%of a vector. The use of a cell array allows storing vectors of different
%length. 

dirname=uigetdir(); %choose directory of choice
% dirname = 'R:\ELEC 301\sample'

dirlisting=dir(fullfile(dirname)); %get all files in the directory. They are stored
% in dirlisting as a struct array

%create cell arrays
% data_array=cell(1,length(dirlisting)-2); 
data_array=cell(1,1); 
% names=cell(1,length(dirlisting)-2); 
names=cell(1,1); 

count = 1;
for i=1:length(dirlisting)-2
%     if (strcompi(dirlisting(i+2).name(length(dirlisting(i+2).name)-3:end),'.mat'))
    if (dirlisting(i+2).name(length(dirlisting(i+2).name)-3:end)=='.mat')
        y=load(strcat(dirname,'/',dirlisting(i+2).name));
        dat=y.val; %get the values in y into a vector dat
        data_array{count}=dat;
        names{count}=dirlisting(i+2).name;
        count = count + 1;
    end
end
return






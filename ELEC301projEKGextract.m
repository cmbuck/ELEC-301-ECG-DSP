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

dirlisting=dir(fullfile(dirname)); %get all files in the directory. They are stored
% in dirlisting as a struct array

%create cell arrays
data_array=cell(1,length(dirlisting)-2); 
names=cell(1,length(dirlisting)-2); 

for i=1:length(data_array)
    y=load(strcat(dirname,'/',dirlisting(i+2).name));
    dat=y.val(1:end); %get the values in y into a vector dat
    data_array{i}=dat;
    names{i}=dirlisting(i+2).name;
end
return






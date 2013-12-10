%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function [sfreq, D] = LoadHeaderData

Fileloc = 'C:\MATLAB7\Work\'; 
Filename = input('Enter ECG File Name = ','s'); % Input Filename 
Headerfile = strcat(Filename,'.hea'); % Header In TXT 
Format 
load (Filename); % .mat file for Data 

fprintf(1,'\nK> Loading Data from Header File %s ...\n', 
Headerfile); 
signalh = fullfile(Fileloc, Headerfile); 
fid1 = fopen(signalh,'r'); 
z = fgetl(fid1); 
A = sscanf(z, '%*s %d %d',[1,2]); 
nosig = A(1); % Number Of Signals 
sfreq = A(2); 
clear A; 
z = fgetl(fid1); 
A = sscanf(z, '%*s %*d %d %d %d %d',[1,4]); 
gain = A(1); % Integers Per mV 
clear A;
S = sfreq*60; 
counter1=0; 
counter2=0; 
counter3=0; 
for n = 0:5 
    tic 
    j = S*n+1:1:S*(n+1); 
    D = val(j); 
    dat = length (D); 
    k = 1:1:dat; 
    D = D(k)/gain; 

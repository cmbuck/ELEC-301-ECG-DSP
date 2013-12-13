Fs=10000; %sampling frequency 10kHz
% [data_array, names]=ELEC301projEKGextract();
% A=data_array{1,2}(9,1:10000);
% B=filter(ones(1,5)/5,1,A);
% C = medfilt1(B,200);
% D = medfilt1(C,600);
% E=B-D;

F=cwt(E,1:4,'bior2.4');
G=F';
G=G(:,4);

[R_index, R_t, R_amp] = RPeakDetect(Fs, G);
Roverlay=zeros(1,length(E));
Roverlay(R_index)=R_amp;
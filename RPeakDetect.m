function [R_index, R_t, R_amp] = RPeakDetect(sfreq,D)

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

thresh = 0.6;
len = length(x);
tt = 1/sfreq:1/sfreq:ceil(len/sfreq);
t = tt(1:len);
max_h = max (x(round(len/4):round(3*len/4)));%segment search area first
                                             %find the highest bumps in the
                                             %ECG_1
poss_reg = x>(thresh*max_h); %then build an array of segments to look in
                             %find indices into boudaries of each segment
left = find(diff([0 poss_reg'])==1); %remember to zero pad at start
right = find(diff([poss_reg' 0])==-1); %remember to zero pad at end

%loop through all possibilities
for (i=1:length(left))
    [maxval(i) maxloc(i)] = max( x(left(i):right(i)) );
    [minval(i) minloc(i)] = min( x(left(i):right(i)) );
    maxloc(i) = maxloc(i)-1+left(i); %add offset of present location
    minloc(i) = minloc(i)-1+left(i); %add offset of present location
end
R_index = maxloc;
R_t = t(maxloc);
R_amp = maxval;

return

                                              

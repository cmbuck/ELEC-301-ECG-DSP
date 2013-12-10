%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function [TP_index,TP_amp,TP_t] = TPointDetect(T_peak_index,H_R,sfreq,D)

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

T_len = length(T_peak_index);
for j = 1:T_len
    IT1 = T_peak_index(j);
    for i = IT1:-1:IT1-(round(sfreq*0.035) *(H_R/72)) 
        TP_index(j) = i;
        TP_amp(j) = x(i,1);
        TP_t(j) = t(1,i);
    end
end

return

%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function [T_peak_index,T_peak,T_peak_t] = TPeakDetect(R_index,J_index,H_R,sfreq,D)

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

J_len = length(J_index);
for j = 1: J_len
    P1 = R_index(j)+ (round(sfreq*0.4) *(H_R/72)); 
    P2 = J_index (j)+ (round(sfreq*0.08) *(H_R/72)); 
    if P1> length (x)|P2> length (x)
        break
    end
    if P1 > P2
        [T_peak(j),T_peak_index(j)] = max(x(P2:P1)); 
        T_peak_index(j) = T_peak_index(j)+ P2; 
    else
        [T_peak(j),T_peak_index(j)] = max(x(P1:P2)); 
        T_peak_index(j) = T_peak_index(j)+ P1;  
    end
    T_peak_t (j)= t(T_peak_index (j)); 
end

return



%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function [P_index,P_amp,P_t] = PPointDetect(K_index,H_R,sfreq,D)

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

K_len = length(K_index);
for j = 1:K_len
    IK1 = K_index(j);
    for i=IK1:-1:IK1- (round(sfreq*0.08) *(H_R/72))
        if i==0 
            P_index(j) = 1;
            P_amp(j) = x(1,1);
            P_t(j) = t(1,1);
            break
        end
        P_index(j) = i;
        P_amp(j) = x(i,1);
        P_t(j) = t(1,i);
    end
end

return

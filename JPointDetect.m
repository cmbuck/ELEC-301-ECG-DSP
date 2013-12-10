%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function [J_index, J_amp, J_t] = JPointDetect(S_index,H_R,sfreq,D)

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

S_len = length(S_index);
for j = 1:S_len
    IS1 = S_index(j);
    for i = IS1:IS1 + (round(sfreq*0.03) *(H_R/72))
        if i==0
            J_index(j) = 1;
            J_amp(j) = x(1,1);
            J_t(j) = t(1,1);
            break
        end
        if i> length(x)
            break
        end
        if x(i,1) >=0
            J_index(j) = i;
            J_amp(j) = x(i,1);
            J_t(j) = t(1,i);
            break
        end
    end
end

return
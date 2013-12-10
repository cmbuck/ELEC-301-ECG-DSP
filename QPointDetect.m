function [Q_index, Q_amp, Q_t] = QPointDetect(R_index,H_R,sfreq,D)

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

R_len = length(R_index);
for j = 1:R_len
    IR1 = R_index(j);
    for i = IR1:-1:IR1- (round(sfreq*0.03 *(H_R/72)))
        if i == 0|i==length (x) 
            Q_index(j) = 1;
            Q_amp(j) = x(1,1);
            Q_t(j) = t(1,1);
           break
        end
        if x(i,1)< x(i+1,1) && x(i,1)< x(i-1,1)
            Q_index(j) = i;
            Q_amp(j) = x(i,1);
            Q_t(j) = t(1,i);
            break
        end
    end
end

return


function [K_index,K_amp,K_t] = KPointDetect(Q_index,H_R,sfreq,D)

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

Q_len = length(Q_index);
for j = 1:Q_len 
    IQ1 = Q_index(j); 
    for i=IQ1:-1:IQ1- (round(sfreq*0.03) *(H_R/72)) 
        if i == 0 
            K_index(j) = 1; 
            K_amp(j)= x(1,1); 
            K_t(j)=t(1,1); 
            break 
        end 
        if x(i,1)>=0 
            K_index(j) = i; 
            K_amp(j)= x(i,1); 
            K_t(j)=t(1,i); 
            break 
        end 
    end 
    if i == 0 
        K_index(j) = 1; 
        K_amp(j)= x(1,1); 
        K_t(j)=t(1,1); 
        break 
    end 
    if x(i,1)< x(i+1,1) && x(i,1)< x(i-1,1) 
        K_index(j) = i; 
        if K_index(j)==0  
            K_index(j)=1; 
        end 
        K_amp(j)= x(i,1); 
        K_t(j)=t(1,i); 
    end
end

return
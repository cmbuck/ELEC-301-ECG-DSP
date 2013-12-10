function plot(sfreq,D)

tt = 1/sfreq:1/sfreq:ceil(len/sfreq);
t = tt(1:len);

D = transpose(D);
D = cwt(D,1:4,'bior2.4'); %Performing Continuous Wavelet Transform using 
                          %Biorthogonal Wavelet
D = transpose(D);
x = D(:,4);
clear D;

[R_index, R_t, R_amp] = RPeakDetect(sfreq,D);
H_R = HeartRateCalc(R_t);
[S_index, S_amp, S_t] = SPointDetect(R_index,H_R,sfreq,D);
[Q_index, Q_amp, Q_t] = QPointDetect(R_index,H_R,sfreq,D);
[J_index, J_amp, J_t] = JPointDetect(S_index,H_R,sfreq,D);
[T_peak_index,T_peak,T_peak_t] = TPeakDetect(R_index,J_index,H_R,sfreq,D);
[TP_index,TP_amp,TP_t] = TPointDetect(T_peak_index,H_R,sfreq,D);
[K_index,K_amp,K_t] = KPointDetect(Q_index,H_R,sfreq,D);
[P_index,P_amp,P_t] = PPointDetect(K_index,H_R,sfreq,D);

figure 
sublot(2,1,1)
plot(t,x), grid on;
title('Level 4 2^4 Biorthogonal Wavelet Transformed ECG Signal')
ylabel('ECG')
subplot(2,1,2)

plot(t,x,'b'); hold on;
plot(S_t,S_amp,'+r'), grid on; hold on;
plot(R_t,R_amp,'+k'); hold on;
plot(Q_t,Q_amp,'+g'); hold on;
plot(T_peak_t,T_peak,'+y'); hold on;
plot(TP_t,TP_amp,'+m'); hold on;
plot(J_t,J_amp,'+c'); hold on;
plot(K_t,K_amp,'*r'); hold on;
plot(P_t,P_amp,'*m');

title('Biorthogonal Wavelet Transformed ECG Signal with Q-Peaks(green),R-Peaks(black),S-Peaks(red)')
ylabel('ECG+S+R+Q+P+J')
hold off;
fprintf(1,'\nK> Analysis Complete \n');



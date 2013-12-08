function [ output_signal ] = BaselineWanderCorrect( input_signal )
% Apply Baseline Wander Correction to the input signal

B = filter(ones(1,5)/5,1,input_signal); %apply lowpass FIR filter
C = medfilt1(B,200);    %apply first  median filter
D = medfilt1(C,600);    %apply second median filter

output_signal = B - D;  %subtract gross offset from original signal

end


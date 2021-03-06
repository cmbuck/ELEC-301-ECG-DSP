%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function H_R = HeartRateCalc(R_t)

for j = 2:length(R_t);
    HR(j) = R_t(j) - R_t(j-1);
end

H_R = 60/(mean (HR));
fprintf (1,'\nK> Heart Rate is %d \n',H_R); 
return 

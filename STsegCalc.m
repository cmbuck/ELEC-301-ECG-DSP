%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function ST = STsegCalc(J_index,TP_index)

a = length(J_index);
b = length(TP_index);
if a==b
    j = 1:1:J_len;
    ST(j) = mean(x(J_index(j):TP_index(j)));
end
if a>b
    j = 1:1:b;
    ST(j)= mean(x(J_index(j):TP_index(j)));
end
if a<b
    j = 1:1:a;
    ST(j) = mean(x(J_index(j):TP_index(j)));
end

return
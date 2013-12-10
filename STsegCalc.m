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
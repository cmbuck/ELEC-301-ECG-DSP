function ISO = IsoelecLineCalc(P_index,K_index)

K_len = length(K_index);
j = 1:1:K_len;
ISO(j) = mean(x(P_index(j):K_index(j)));

return
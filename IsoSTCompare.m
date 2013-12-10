%This code is adapted from Kasturi Joshi and Edward Labrador's code
%published in Early Myocardial Infarction Detection, May 2009.
function IsoSTCompare(ISO,ST)

a = length(ISO);
b = length(ST);
counter1 = 0;
counter2 = 0;
counter3 = 0;
if a==b
    for j = 1:a
        counter1 = counter1 + 1;
        if (ISO(j))>= (ST(j)+0.0001) && ISO(j)>=ST(j)- 0.0001|ISO(j)==ST(j)
            counter2 = counter2 + 1;
        else
            counter3 = counter3 + 1;
        end
    end
end

if a<b 
    for j=1:a 
        counter1=counter1+1; 
        if ISO(j)>=ST(j)+0.0001 && ISO(j)>=ST(j)-
            0.0001|ISO(j)==ST(j) 
            counter2=counter2+1; 
        else 
            counter3=counter3+1; 
        end 
    end 
end

if a>b 
    for j=1:b 
        counter1=counter1+1; 
        if ISO(j)>=ST(j)+0.0001 && ISO(j)>=ST(j)-
            0.0001|ISO(j)==ST(j) 
            counter2=counter2+1; 
        else 
            counter3=counter3+1; 
        end
    end
end

clear ISO;
clear ST;
toc
fprintf(1,'\nK> %d loop completed %n \n',n); 
end 
fprintf (1,'\nK> total number of signals evaluated is %d\n',counter1) 
fprintf (1,'\nK> total number of signals without MI is %d\n',counter2) 
fprintf (1,'\nK> total number of signals with MI is %d\n',counter3) 
if counter3/counter1>=0.95 
    fprintf(1,'\nK>WARNING: MI\n'); 
else 
    fprintf(1,'\nK>No MI\n'); 
end 


s = round(rand(1,1000));
k = round(rand(1,16));
w = [8 8 8 8 8 8 8 8 8 8 8 8];

S = nadajnik_DVB(s,k,w,40);
S1 = odbiornik_DVB(S,k,w);

isequal(s,S1)

stem(s - S1)
title('Roznica sygnalow: s - S');
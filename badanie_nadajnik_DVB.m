s = round(rand(1,50));
k = round(rand(1,16));
w = [7 7 7 7 7];

S = nadajnik_DVB(s,k,w,19);
S1 = odbiornik_DVB(S,k,w);

isequal(s,S1)
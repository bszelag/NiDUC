s = round(rand(1,100));
k = round(rand(1,16));
w = [1 0 1 1 0 1 1 1 1 0];

S = nadajnik_DVB(s,k,w,10);
S1 = odbiornik_DVB(S,k,w);

length(S)
C = [s;S1];
isequal(s,S1)

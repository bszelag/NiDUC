s = round(rand(1,200));
k = round(rand(1,16));
w = [8,8,8,8,8,8,8,8,8];

DANE=[];
i=1;
while i <= length(s)

N = nadajnik_DVB(s,k,w,i);
N1 = odbiornik_DVB(N,k,w);

m = s - N1;
zle = (sum(abs(m))+(length(N)-length(s)));
dobrze = length(N) - zle;
temp_dane = dobrze/(dobrze+zle);
i++;
DANE = [DANE,temp_dane];
endwhile

DANE

figure(1)
plot(DANE)

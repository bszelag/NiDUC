s = round(rand(1,1000));
k = round(rand(1,16));
w = [8,8,8,8,8];


#isequal(s(7:11),[0 0 0 0 0])



N = nadajnik_DVB(s,k,w,100);
N1 = odbiornik_DVB(N,k,w);
M = s - N1;
#S1 = DVB(k,s)
#S2 = [S1(1:6),shift(S1(7:end),1)]
#S3 = DVB(k,S2)
#N1 = DVB(k,N(1:500));
#N2 = DVB(k,N(506:end-5));
#finaN = [N1,N2];
#m = s - S3
#S = [s(1:500),[8,8,8,8,8],s(501:length(n))]
#M1 = s - finaN;
#endt = [M;m]
#S1 = odbiornik_DVB(S,k,w,5)



figure(1)
hist(repetitions(N))
figure(2)
stem( s - N1)
#title('Roznica sygnalow: s - S1');


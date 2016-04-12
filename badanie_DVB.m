s = round(rand(1,1000)); % Sygnał Losowy
z = zeros(1,1000);         % Sygnał samych zer
o = ones(1,1000);           % Sygnał samych jedynek

KEY = round(rand(1,16)); % Klucz losowy
% KEY = [ 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ] % Klucz naprzemienny
% TODO: Klucz z literatury.

S = DVB(KEY,s);
Z = DVB(KEY,z);
O = DVB(KEY,o);

figure('Name','Scrambling DVB - Badanie Powtorzen')

subplot(2,2,1)
R = repetitions(s);
hist(R,max(R))
clear('R')
grid on
title('Sygnal Losowy')

subplot(2,2,2)
R = repetitions(S);
hist(R,max(R))
clear('R')
grid on
title('Scramblowany Sygnal Losowy')

subplot(2,2,3)
R = repetitions(Z);
hist(R,max(R))
clear('R')
grid on
title('Scramblowany Sygnal Zer')

subplot(2,2,4)
R = repetitions(O);
hist(R,max(R))
clear('R')
grid on
title('Scramblowany Sygnal Jedynek')


figure('Name','Test Descramblingu')

S = DVB(KEY,S);

subplot(3,1,1)
stem(s,'.')
title('s = Sygnal oryginalny');

subplot(3,1,2)
stem(S,'.')
title('S = Sygnal descramblowany');

subplot(3,1,3)
stem(s - S,'.')
title('Roznica sygnalow: s - S');









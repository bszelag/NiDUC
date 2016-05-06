
#Klucz sluzacy do synchronizacji
synchronizationKey = [];

#ciag znakow, który przerywa synchronizacje
breakSignal = [0 0 0 0 0];

#Tworzenie klucza o odpowiedniej dlugosci
global keyLength = 10;

#synchronizationKeyRand = round(rand(1, keyLength));
synchronizationKeyRand = [3 3 3 3 3 3 3 3 3 3];

#Wysylanie sygnalu zescramblowanego + klucz
function [out] = send_dvb(dvb, synchKey)
out = [dvb synchKey];
endfunction

#Odbieranie sygnalu wraz z synchronizacją, a następnie descramblowanie sygnalu
function [out] = get_dvb(key, in, synchKey, breakSignal)
#break vektor i key vektor
  newSignal = in;
#Petla sprawdza sygnal po bicie i sprawdza aż natrafi na sygnał
#Sprawdzanie jest po bicie, gdyż może to pomóc na przyszłość, jeżeli sygnał byłby sumą kilku sygnalów, 
#to petle powinny sobie poradzic z oddzieleniem kluczy i descramblowaniem odpowiednich bitow
  
  for i = 1:length(in)
    k = newSignal(i:i+length(synchKey)-1);
  #szukanie klucza w ciągu
    if (k == synchKey)
     newSignal(i:i+length(synchKey)-1) = [];
     newSignal(i+length(synchKey)-1:end) = 0;
    #in(:,[i-length(synchKey):i]) = [];
      #usuwanie z sygnalu klucza, żeby można było descramblowac
      break
    endif
  endfor
  
  #petla która zajmie się przerywaniem i descramblowaniem, jeżeli natrafi na ciag znaków jaki jest z góry ustalony czyli 5 zer,
  #to petla zostaje przerwana i uzyskujemy uszkodzony sygnal

  brCount = 0;
  for i = 1:length(newSignal)
    if i < length(newSignal) - length(breakSignal)
    b = newSignal(i:i+length(breakSignal)-1);
    
  #zrywanie sygnalu 
      if (b == breakSignal)
      newSignal(i) = [];
      brCount++;;
  #descramblowanie sygnalu po kluczu
      endif
    endif
      out = DVB(key, newSignal);
  endfor
    brCount
   z = zeros(1,brCount);
   out = [out z];
endfunction

KEY = round(rand(1,16));
s = round(rand(1,100));
S = DVB(KEY,s);
sy = send_dvb(S, synchronizationKeyRand);
synchronizationKeyRand;
SY = get_dvb(s, sy, synchronizationKeyRand, breakSignal);

figure('Name','Test Descramblingu')

subplot(4,1,1)
stem(s,'.')
title('s = Sygnal oryginalny');

subplot(4,1,2)
stem(SY,'.')
title('S = Sygnal descramblowany');

subplot(4,1,3)
stem(s - SY,'.')
title('Roznica sygnalow: s - S');

subplot(4,1,4)
stem(S,'.')
title('s = Sygnal oryginalny');





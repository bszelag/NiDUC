## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} scramble (@var{input1}, @var{input2})
##
##
##  Dla każdego elementu macierzy i, która jest kopią sygnału zadanego:
##  tworzymy tymczasowy wynik xora ostatniej i przedostatniej wartości klucza
##  przesuwamy klucz o jedno miejsce w prawo
##  tymczasową wartość wpisujemy w miejsce pierwsze klucza (pozbywamy się "ostatniego" bitu)
##  na koniec sygnalu zwracanego dodajemy xor wartośći tymczasowej i wartośći z sygnalu zadanego.
##
##  Ponowne scramblowanie sygnału już scramblowanego powinno dać taki sam sygnał (scrambler jest descramblerem). Można powrównać przez Sygnał==Sygnał_Scramblowany. octave wyświetli macierz samych jedynek (zgodność na każdym miejscu)
##
## @seealso{}
## @end deftypefn
##
##
## Author: GRUPA IV
## Created: 2016-03-18

function [out] = DVB (key, in)
  
  
  for i = in
    temp = xor (key(end), key(end - 1));
    key =  shift(key,1);
    key(1) = temp;
    out(end+1) = xor (temp, i);
  endfor
  
endfunction
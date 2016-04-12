## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} RepAnal (@var{input1}, @var{input2})
## 
##
## Do macierzy wzrwacanej dodajemy pierwszy argument = 0.
## Tworzymy macierz kolejnych liczb od 1 do N-1 gdzie N to długość sygnalu. Będą to indeksy.
## Sprawdzamy parami kolejne znaki. Jeżeli te same to ostatnia wartosć wzrasta o jeden. Jeżeli inne to dodajemy wartość 0 na ostatnim (nowym) miejscu macierzy. 
## Powtarzamy i zwracamy macierz powtórzeń, takiego samego sygnału.
##
##
## @seealso{}
## @end deftypefn

## Author: GRUPA IV
## Created: 2016-03-21

function [out] = repetitions (in)

 
 out = [0];
 
    N = length(in);
    for i = 1:N-1;
    
      if(in(i) == in(i+1))
        out(end)++;
        
      else
        out(end + 1) = 0;
      endif
   
   endfor
endfunction

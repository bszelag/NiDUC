## V34
## Funkcja: 1 + x^-18 + x^-23  = x^23 + x^5 + 1
## Wynik ktory idzie do wyjscia - wchodzi na pierwsze miejsce klucza

## output[n] = input[n] + (key[23] + key[5]))
## key -> shr(1)
## key[0] = output[n]

##key[end] - wg tych wzorów end powinno byc rowne 23 - czyli klucz o dlugosci 23, nie 15!


function [out] = v34 (key, in)
  
  for i = in
    temp = xor (i,  xor (key(end), key(5)));
    key =  shift(key,1);
    out(end+1) = temp;
    key(1) = temp;
  endfor
  
endfunction
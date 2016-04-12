## V34
## Funkcja: 1 + x^-18 + x^-23  = x^23 + x^5 + 1
## INput - idzie na pierwsze msc w kluczu

## output[n] = input[n] + (key[23] + key[5]))
## key -> shr(1)
## key[0] = input[n]


function [out] = v34_d (key, in)
  
  for i = in
    temp = xor (i,  xor (key(end), key(5)));
    key =  shift(key,1);
    out(end+1) = temp;
    key(1) = i;
  endfor
  
endfunction
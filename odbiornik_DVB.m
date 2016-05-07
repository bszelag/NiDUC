function [out] = odbiornik_DVB(signal_in, KEY, WORD)

  out = [];

  i = 0;
  temp = [];

  while length(WORD) + i <= length(signal_in)

    comp = signal_in(1 + i:length(WORD) + i);

    if isequal(comp,WORD)

      out = [out,DVB(KEY,temp)];
      temp = [];
      i += length(WORD);
      
      elseif isequal(comp,[0 0 0 0 0])
       
        temp = [temp, [1 1 1 1 1]];
        i += 5;

      else
      
      temp = [temp,signal_in(1 + i)];
      i += 1;

    endif
    
  endwhile
  out = [out, DVB(KEY,[temp, signal_in(i+1:end)])];

endfunction

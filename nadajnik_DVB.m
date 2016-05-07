function [out] = nadajnik_DVB(signal_in, KEY, WORD, N)

  out = [];
  
  i = 0;
  
  while ( N * (i + 1) <= length(signal_in))
     
    sp = N * i + 1;
    ep = N * (i + 1);

    out = [out,DVB(KEY,signal_in(sp:ep)),WORD];
    i++;
  
  endwhile
  
  out = [out, DVB(KEY,signal_in(N * i + 1:end))];

endfunction

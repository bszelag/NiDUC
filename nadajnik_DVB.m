function [out] = nadajnik_DVB(signal_in, KEY, WORD, N)

  out = [];
  
  i = 0;
  
 
  
  while ( N * (i + 1) <= length(signal_in))
     
    sp = N * i + 1;
    ep = N * (i + 1);
    
   
    temp = DVB(KEY,signal_in(sp:ep));
    j = 1;
   while  j+4 <=length(temp)
    
     comp = temp(j:j+4);
     
     if isequal(comp,[0 0 0 0 0])
     temp = [temp(1:j),shift(temp(j+1:end),1)];
      
     endif
     j++;
    endwhile

    out = [out,temp,WORD];
    i++;
  
  endwhile
  
  out = [out, DVB(KEY,signal_in(N * i + 1:end))];

endfunction
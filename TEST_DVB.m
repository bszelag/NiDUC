KEY = [ 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ];

IN = [1 0 1 0 1 1 1 0];
signal = [1 0 1 0 1 1 1 0];
WORD = [3 3];



out = nadajnik_DVB(IN,KEY,WORD,2)

test=DVB(KEY,signal)
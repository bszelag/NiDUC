#KEY = [ 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ];
KEY = round(rand(1,23));

IN = [1 0 1 0 1 1 1 0];
signal = [1 0 1 0 1 1 1 0];
WORD = [3 3];



out = nadajnik_v34(IN,KEY,WORD,2)

test=v34(KEY,signal)
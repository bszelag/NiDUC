## Copyright (C) 2016 Szymon Wojciechowski
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} nadajnik_DVB (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Szymon Wojciechowski <szymon@szymon-linux>
## Created: 2016-05-05

function [out] = nadajnik_DVB(signal_in, KEY, WORD, N)

  out = [];
  i = 1;
  
  while ( (i * N) < length(signal_in))
    
    sp = (i-1) * N + 1;
    ep = N*i;

    out = [out, DVB(KEY, signal_in(sp:ep)), WORD];
    i++;
  endwhile
  
  out = [out, signal_in((i-1) * N + 1 : end)];
  out(end+1:N*i) = 0;
  out = [out, WORD]; 


endfunction

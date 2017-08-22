## Copyright (C) 2017 Maxime Bories
## 
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

function s = zenity(text, columns, data)

  print_column = "2";
  columns = sprintf('--column="%s" ', columns{:});
  data = sprintf("%s ", data{:});

  cmd = sprintf('zenity --list --checklist --title="Velog" --text="%s" --print-column="%s" --separator=":" %s %s --width=480 --height=640', ...
                text, print_column, columns, data);
  [status, output] = system(cmd);
  if (status == 0)
    if (length(output) > 0 && output(end) == "\n")
      output = output(1:end-1);
    endif
    idx = strfind(output, ":");
    idx = [0, idx, length(output)+1];
    l = length(idx);
    if (l == 2)
      s = output;
    else
      s = cell(1, l-1);
      for i = 1:l-1
        s{i} = output((idx(i)+1):(idx(i+1)-1));
      endfor
    endif
  elseif (status == 1)
    s = "";
  else
    error("zenity: %s", output);
  endif
endfunction
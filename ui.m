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

function [index, names, plots, signs] = ui()
  
  [index, names] = textread('index.txt', '%s %s');
  N = length(index);

  try
    load("state.txt");
    tab = [cellPlots; index'; names'];
  catch
    cellPlots = repmat({'FALSE'}, 1, N);
    cellSigns = repmat({'FALSE'}, 1, N);
    tab = [cellPlots; index'; names'];
  end

  S = zenity('Select probes to plot:', {'Plots', 'Probe', 'Name'}, tab);

  if iscell(S)
    plots = cellfun(@str2num, S);
  else
    plots = str2num(S);
  end

  boolPlot = ismember(cellfun(@str2num, index), plots);
  indicesPlots = find(boolPlot);
  cellPlots = repmat({'FALSE'}, 1, N);
  cellPlots(boolPlot) = {'TRUE'};

  tab = [cellSigns(indicesPlots); index(indicesPlots)'; names(indicesPlots)'];
  S = zenity('Select signed probes:', {'Signed', 'Probe', 'Name'}, tab);

  if iscell(S)
    signs = cellfun(@str2num, S);
  else
    signs = str2num(S);
  end

  boolSigns = ismember(cellfun(@str2num, index), signs);
  cellSigns = repmat({'FALSE'}, 1, N);
  cellSigns(boolSigns) = {'TRUE'};

  save("state.txt", "cellPlots", "cellSigns");
endfunction
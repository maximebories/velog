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

clear all
close all

[index, names, plots, signs] = ui();
signs = ismember(plots, signs);

for i = 1:length(plots)
	j = plots(i);

	try
    data = load(['data/' int2str(j) '.txt']);
    timestamps = data(:, 1);
		values = data(:, 2);
		if (signs(i) == 1)
			values = unsign2sign(values);
		end
		figure('name', ['Probe ' int2str(j) ': ' names(cellfun(@str2num, index) == j){1}]);
		plot(timestamps, values, '.', 'MarkerSize', 10)
		grid on
	catch
		display(['Probe ' int2str(j) ' could not be plotted'])
	end
end
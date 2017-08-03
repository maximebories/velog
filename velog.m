clear all
close all

[index, names] = textread('index.txt', '%d %s');
signs = load('signs.txt');
plots = load('plots.txt');

for i = 1:length(plots)
	j = plots(i);

	try
		data = load(['data/' int2str(j) '.txt']);
		vec = data(:,2);
		if (signs(j+1) == 1)
			vec = unsign2sign(vec);
		end
		figure('name', ['Probe ' int2str(j) ': ' names(index == j){1}]);
		plot(data(:,1), vec(:), '.', 'MarkerSize', 10)
		grid on
	catch
		display(['Probe ' int2str(j) ' could not be plotted'])
	end
end

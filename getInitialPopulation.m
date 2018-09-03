function [ initial_population ] = getInitialPopulation( no_of_cities, size_of_population )
%GETINITIALPOPULATION
initial_population = zeros(size_of_population, no_of_cities);
for i = 1 : size_of_population
    tour = randperm(no_of_cities, no_of_cities);
    while(size(find(ismember(initial_population, tour, 'rows') == 1), 1) == 1)
        tour = randperm(no_of_cities, no_of_cities);
    end
    initial_population(i, :) = tour;
end
end


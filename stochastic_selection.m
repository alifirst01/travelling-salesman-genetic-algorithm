function [ population, max_fitness, chk ] = stochastic_selection( old, new, pop_size, cities_dist, chk )
%POPULATION_SELECTION
max_fitness = 0;
population = zeros(size(old, 1) + size(new, 1), 313);
j = 1;
for i = 1 : pop_size
    population(j, :) = [old(i, :), Fitness_Func(old(i, :), cities_dist)];
    population(j + 1, :) = [new(i, :), Fitness_Func(new(i, :), cities_dist)];
    j = j + 2;
end
[~, max_ids] = sort(population(:, 313), 'descend');
max_fitness = population(max_ids(1, 1), 313);
population = population(max_ids(1 : pop_size), 1 : 312);
if(chk >= 5)
    chk = 0;
    population = getInitialPopulation(size(cities_dist, 1), pop_size);
end
end


function [ population, max_fitness, chk ] = randomizedBest_selection( old, new, pop_size, cities_dist, chk )
%RANDOMIZEDBEST_SELECTION
max_fitness = 0;
%Random Population Initialization
randomized_population = getInitialPopulation(size(cities_dist, 1), pop_size);
population = zeros(size(old, 1) + size(new, 1) + size(randomized_population, 1), 313);

j = 1;
for i = 1 : pop_size
    population(j, :) = [randomized_population(i, :), Fitness_Func(randomized_population(i, :), cities_dist)];
    population(j + 1, :) = [old(i, :), Fitness_Func(old(i, :), cities_dist)];
    population(j + 2, :) = [new(i, :), Fitness_Func(new(i, :), cities_dist)];
    j = j + 3;
end
[~, max_ids] = sort(population(:, 313), 'descend');
max_fitness = population(max_ids(1, 1), 313);
population = population(max_ids(1 : pop_size), 1 : 312);
if(chk >= 5)
    chk = 0;
    population = getInitialPopulation(size(cities_dist, 1), pop_size);
end
end


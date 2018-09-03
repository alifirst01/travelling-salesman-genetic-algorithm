function [ population, max_fitness, chk ] = tournament_selection( old, new, pop_size, cities_dist, chk )
%TOURNAMENT_SELECTION
population = zeros(size(old, 1) + size(new, 1), 313);
pop = zeros(pop_size, 313);
sample_size = 50;
selection_size = 5;
j = 1;
for i = 1 : pop_size
    population(j, :) = [old(i, :), Fitness_Func(old(i, :), cities_dist)];
    population(j + 1, :) = [new(i, :), Fitness_Func(new(i, :), cities_dist)];
    j = j + 2;
end
for i = 1 : 5 : pop_size
    k = randperm(size(population, 1));
    rand_sample = population(k(1 : sample_size), :);
    [~, max_ids] = sort(rand_sample(:, 313), 'descend');
    best = rand_sample(max_ids(1 : selection_size,1), :);
    pop(i:i + selection_size - 1, :) = best;
end
population = pop;
max_fitness = max(population(:, 313));
[~, max_ids] = sort(population(:, 313), 'descend');
population = population(max_ids(1 : pop_size), 1 : 312);
if(chk >= 5)
    chk = 0;
    population = getInitialPopulation(size(cities_dist, 1), pop_size);
end
end


function [ population, result, check ] = fitness_population( population, cities_dist, fitness_req )
%FITNESS_POPULATION
probability_fitness = zeros(size(population, 1), 1);
sum = 0.0;
check = 0;
result = [];
for i = 1 : size(probability_fitness, 1)
    fitness = Fitness_Func(population(i, :), cities_dist);
    if(fitness > fitness_req)
        result = population(i, :);
        check = 1;
        break
    end
    probability_fitness(i, :) = fitness;
    sum = sum + fitness;
end
if check == 0
    population = horzcat(population, (probability_fitness ./ double(sum)) * 10000);
end

end


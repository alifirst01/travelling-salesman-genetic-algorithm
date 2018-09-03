function [ fitness ] = Fitness_Func( tour_Path, cities_dist )
%FITNESS_FUNC
fitness = 0;
for i = 1 : size(tour_Path, 2) - 1
    fitness = fitness + cities_dist(tour_Path(i), tour_Path(i + 1));
end
fitness = fitness - 300000;
fitness = 1.0 / double(fitness);
end


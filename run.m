%Initialization
clear ; close all; clc
no_of_cities = 312;
size_of_population  = 100;                   %Size of Population
crossover_point = 100;                       
mutation_rate = 0.05;                        %Starting Mutation Rate 5%
Required_Fitness_Distance = 330000;          %Required Fitness in sum of distance
fitness_req = 1 / (Required_Fitness_Distance - 300000);
selection_method = 3;                        %Selection Methods: 1.Stochastic   2.Tournament  3.Randomized Best
crossover_method = 2;                        %CrossOver Methods: 1. 1-Point     2. 2-Point    3. Uniform
max_iterations = 100;                       %Maximum Iterations allowed
last_fitness = 0;
iterations = 0;
check = 0;
chk = 0;
lim = 0;

%Getting Cities Data
file = fullfile('Cities Data','usca312_dist.txt');
fileID = fopen(file,'r');
scan_cities = textscan(fileID, '%d', 'Delimiter','\n');
cities_dist = reshape(scan_cities{1, 1}, no_of_cities, no_of_cities);

%Initilaizing Population and its fitness
population = getInitialPopulation(no_of_cities, size_of_population);
[population, result, check] = fitness_population(population, cities_dist, fitness_req);
new_population = zeros(size_of_population, no_of_cities);
    
if (check == 0)
    %GA
    while(1)
        iterations = iterations + 1;
        if iterations > max_iterations
            lim = 1;
            break;
        end
        for i = 1 : size(population)
            [p1, p2] = parent_selection(population, size_of_population);
            %Performing Cross Over
            c1 = PMX_Crossover(p1, p2, crossover_point, crossover_method);
            c2 = PMX_Crossover(p2, p1, crossover_point, crossover_method);
            %Performing Mutation
            new_population(i, :) = mutate(c1, mutation_rate);
            new_population(i + 1, :) = mutate(c2, mutation_rate);
            i = i + 1;
            %Result Checking
            if(Fitness_Func(c1, cities_dist) > fitness_req)
                result = c1;
                check = 1;
                break;
            elseif(Fitness_Func(c2, cities_dist) > fitness_req)
                result = c2;
                check = 1;
                break;
            end
        end
        %Population Selection
        if selection_method == 1
            [population, max_fitness, chk] = stochastic_selection(population(:, 1 : no_of_cities), new_population, size_of_population, cities_dist, chk);
        elseif selection_method == 2
            [population, max_fitness, chk] = tournament_selection(population(:, 1 : no_of_cities), new_population, size_of_population, cities_dist, chk);    
        else
            [population, max_fitness, chk] = randomizedBest_selection(population(:, 1 : no_of_cities), new_population, size_of_population, cities_dist, chk);
        end
        %Tuning Mutation Rate
        mutation_rate = tune_mutation_rate(mutation_rate, max_fitness, fitness_req, last_fitness);
        fprintf('Iteration: %d      Max Fitness: %d      Mutation Rate(Percent): %d\n', iterations, (1 / max_fitness) + 300000, int16(mutation_rate * 100));
        if (check == 1 || lim == 1)
            break; end
        [population, ~] = fitness_population(population, cities_dist, fitness_req);
         if(last_fitness == max_fitness) 
             chk = chk + 1; 
         end
        last_fitness = max_fitness;
    end
end
if lim == 0
    fprintf('\nSearch Ended... Desired Fitness Achieved\n')
    fprintf('No of Iterations Performed: %d\n', iterations);
    fprintf('Required Fitness: %d\n', (1 / fitness_req) + 300000);
    fprintf('Fitness Achieved: %d\n', (1 / Fitness_Func(result, cities_dist)) + 300000);
    fprintf('\nPress enter to display graph.\n');
    pause;
    showGraphPath(result);
else
    disp('Max Iterations reached')
end
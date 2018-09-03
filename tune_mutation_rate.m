function rate = tune_mutation_rate( rate, max_fitness, fitness_req, last_fitness )
%TUNE_MUTATION_RATE
if last_fitness == max_fitness
    par = -1;
else
    par = 1;
end
rate = rate + par * (0.01 * abs(max_fitness - fitness_req) * 100000);
if((rate * 100) < 3)
    rate = 0.05;
end
end


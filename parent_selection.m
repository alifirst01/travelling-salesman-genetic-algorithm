function [ p1, p2 ] = parent_selection( population, size )
%PARENT_SELECTION 
p = randsample(1 : size, 2, true, population(:, 313)');
p1 = population(p(1), 1:312);
p2 = population(p(2), 1:312);
end


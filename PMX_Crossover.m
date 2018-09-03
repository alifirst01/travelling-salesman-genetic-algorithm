function c = PMX_Crossover( p1, p2, crossover_point, method )
%PMX_CROSSOVER
c = p1;
if(method == 1 || method == 2)
    for i = 1 : crossover_point
        c(1, find(c == p2(1, i))) = c(1, i);
        c(1, i) = p2(1, i);
    end
    if(method == 2)
        for i = 200 : 200 + crossover_point
            c(1, find(c == p2(1, i))) = c(1, i);
            c(1, i) = p2(1, i);
        end
    end
elseif(method == 3)
    uniform_point = size(p2, 2) * 0.5;
    for i = 1 :  uniform_point
        c(1, find(c == p2(1, i))) = c(1, i);
        c(1, i) = p2(1, i);
    end
end
end


function c = mutate( c, rate )
%MUTATE
s1 = 100;
s2 = 250;
nums = 15;
p = randsample([1, 0], 1, true, [rate, 1 - rate]);
if p == 1
    [c(1, s1 : s1 + nums), c(1, s2 : s2 + nums)] = deal(c(s2 : s2 + nums), c(s1 : s1 + nums));
end
end


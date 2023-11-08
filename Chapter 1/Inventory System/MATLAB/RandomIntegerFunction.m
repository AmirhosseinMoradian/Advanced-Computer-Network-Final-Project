% Random integer generation function.
function [Y] = RandomIntegerFunction(probDistrib)

% Generate a U(0,1) random variate.
 u = lcg(1 + 1);

 % Return a random integer in accordance with the 
 % (cumulative) distribution function prob_distrib.

i = 1;

while(u >= probDistrib(i))
i = i + 1;
end

Y = i;
end
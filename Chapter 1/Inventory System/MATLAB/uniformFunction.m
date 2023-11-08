% Uniform variate generation function.
function Z = uniformFunction(a , b)

% Return a U(a,b) random variate.
Z = a + lcg(1 + 1)*(b - a);

end

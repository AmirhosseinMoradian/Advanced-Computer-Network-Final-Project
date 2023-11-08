%Exponential variate generation function.
function [result] = expon(mean)

%Return an exponential random variate with mean "mean".
    result = -mean * log(lcg(2));
    
end
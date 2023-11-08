%Demand event function.
function [InvLevel, TimeNextEvent] = demandFunction(InvLevel, TimeNextEvent, ProbDistribDemand,  MeanInterDemand, SimTime)

% Decrement the inventory level 
% by a generated demand size.
InvLevel = InvLevel - RandomIntegerFunction(ProbDistribDemand)

% Schedule the time of the next demand.
TimeNextEvent(2) = SimTime + expon(MeanInterDemand);

end


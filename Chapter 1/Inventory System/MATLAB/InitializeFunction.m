% Initialization function.
function [SimTime, InvLevel, TotalOrderingCost, AreaHolding, AreaShortage, TimeNextEvent, TimeLastEvent] = InitializeFunction(InitialInvLevel,MeanInterDemand, NumMonths)

%Initialize the simulation clock.
SimTime = 0.0;

%Initialize the state variables.
InvLevel = InitialInvLevel
TimeLastEvent = 0.0;

% Initialize the statistical counters.
TotalOrderingCost = 0.0;
AreaHolding = 0.0;
AreaShortage = 0.0;

% Initialize the event list. Since no order 
% is outstanding, the orderarrival event is 
% eliminated from consideration.

TimeNextEvent(1) = 1.0e+30;
TimeNextEvent(2) = SimTime + expon(MeanInterDemand);
TimeNextEvent(3) = NumMonths;
TimeNextEvent(4) = 0.0;
end
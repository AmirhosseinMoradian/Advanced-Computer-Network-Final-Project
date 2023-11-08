%Update area accumulators for time-average statistics
function [AreaShortage, AreaHolding, TimeLastEvent] = UpdateTimeAvgStatsFunction(AreaShortage, AreaHolding, TimeLastEvent, SimTime, InvLevel)

TimeSinceLastEvent = SimTime - TimeLastEvent;
TimeLastEvent = SimTime;

% Determine the status of the inventory level during the
% previous interval. If the inventory level during the
% previous interval was negative, update area_shortage.
% If it was positive, update area_holding.
% If it was zero, no update is needed.

if (InvLevel < 0)
        AreaShortage = AreaShortage - InvLevel * TimeSinceLastEvent;
elseif (InvLevel > 0)
        AreaHolding = AreaHolding + InvLevel * TimeSinceLastEvent;
end
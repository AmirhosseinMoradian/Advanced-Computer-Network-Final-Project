%Inventory-evaluation event function.
function [TotalOrderingCost, TimeNextEvent, amount] = ...
    evaluateFunction(TotalOrderingCost, TimeNextEvent, amount, bigs, smalls, ...
    InvLevel, SetupCost, IncrementalCost, SimTime, Minlag, Maxlag)

%Check whether the inventory level 
% is less than smalls.
if(InvLevel < smalls)

%The inventory level is less than smalls, so place an 
% order for the appropriate amount.
amount = bigs - InvLevel;
TotalOrderingCost = TotalOrderingCost + SetupCost + IncrementalCost * amount;

% Schedule the arrival of the order. 
TimeNextEvent(1) = SimTime + uniformFunction(Minlag, Maxlag);
else
    amount = amount;
end
% Regardless of the place-order decision, 
% schedule the next inventory evaluation.
TimeNextEvent(4) = SimTime + 1.0;
end
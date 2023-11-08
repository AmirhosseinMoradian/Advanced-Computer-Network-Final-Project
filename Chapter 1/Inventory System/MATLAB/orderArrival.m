% Order arrival event function.
function [InvLevel, TimeNextEvent] = orderArrival(InvLevel, TimeNextEvent, amount)

%Increment the inventory level by the 
% amount ordered.
InvLevel = InvLevel + amount

%Since no order is now outstanding, eliminate 
% the order-arrival event from consideration.

TimeNextEvent(1) = 1.0e+30;

end
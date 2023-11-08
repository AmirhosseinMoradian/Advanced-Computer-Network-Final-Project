%Report generator function.
function reportFunction(TotalOrderingCost, NumMonths, HoldingCost, AreaHolding, AreaShortage, ShortageCost, smalls, bigs, outfile)

% Compute and write estimates 
% of desired measures of performance.

AvgOrderingCost = TotalOrderingCost / NumMonths;
AvgHoldingCost  = HoldingCost * AreaHolding / NumMonths;
AvgShortageCost = ShortageCost * AreaShortage / NumMonths;

fprintf(outfile, "\n\n(%3d,%3d)%15.2f%15.2f%15.2f%15.2f", smalls, bigs, AvgOrderingCost + AvgHoldingCost + AvgShortageCost, ...
    AvgOrderingCost, AvgHoldingCost, AvgShortageCost);

end
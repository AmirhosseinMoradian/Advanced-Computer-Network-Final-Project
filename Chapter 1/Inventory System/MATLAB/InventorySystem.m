% Open input and output files.
infile = fopen('Chapter1Programs\inv.in', 'r');
outfile = fopen('Chapter1Programs\inv.out', 'w');

% Specify the number of events for the timing function.
NumEvents = 4;

% Read input parameters.
A = fscanf(infile,'%d %d %d %d %f %f %f %f %f %f %f', [1, 11]);
InitialInvLevel = A(1);
NumMonths = A(2);
NumPolicies = A(3);
NumValuesDemand = A(4);
MeanInterDemand = A(5);
SetupCost = A(6);
IncrementalCost = A(7);
HoldingCost = A(8);
ShortageCost = A(9);
Minlag = A(10);
Maxlag = A(11);
amount = 0;
ProbDistribDemand = fscanf(infile, '%f %f %f %f', [1, 4]);

% Write report heading and input parameters.
fprintf(outfile, 'Single-product inventory system\n\n');
fprintf(outfile, 'Initial inventory level%24d items\n\n', InitialInvLevel);
fprintf(outfile, 'Number of demand sizes%25d\n\n', NumValuesDemand);
fprintf(outfile, 'Distribution function of demand sizes');
for i = 1:4
fprintf(outfile, '%8.3f', ProbDistribDemand(i));
end
fprintf(outfile, '\n\nMean interdemand time%26.2f\n\n', MeanInterDemand);
fprintf(outfile, 'Delivery lag range%29.2f to%10.2f months\n\n', Minlag, Maxlag);
fprintf(outfile, 'Length of the simulation%23d months\n\n', NumMonths);
fprintf(outfile, 'K =%6.1f   i =%6.1f   h =%6.1f   pi =%6.1f\n\n', SetupCost, IncrementalCost, HoldingCost, ShortageCost);
fprintf(outfile, 'Number of policies%29d\n\n', NumPolicies);
fprintf(outfile, '                 Average        Average');
fprintf(outfile, '        Average        Average\n');
fprintf(outfile, '  Policy       total cost    ordering cost');
fprintf(outfile, '  holding cost   shortage cost');
counter = 0;
% Run the simulation varying the inventory policy.
for i = 1:NumPolicies

%Read the inventory policy, and initialize the simulation.
B = fscanf(infile, '%d %d', [1, 2]);
smalls = B(1);
bigs = B(2);

[SimTime, InvLevel, TotalOrderingCost, AreaHolding, AreaShortage, TimeNextEvent, TimeLastEvent] = InitializeFunction(InitialInvLevel, MeanInterDemand, NumMonths);
% Run the simulation until it terminates after an end-simulation event (type 3) occurs.
counter

NextEventType =0; 

    while (NextEventType ~= 3)

        % Determine the next event.
        [TimeNextEvent, SimTime, NextEventType] = TimingFunction(TimeNextEvent, NumEvents);

        % Update time-average statistical accumulators.
        [AreaShortage, AreaHolding, TimeLastEvent] = UpdateTimeAvgStatsFunction(AreaShortage, AreaHolding, TimeLastEvent, SimTime, InvLevel);

        %Invoke the appropriate event function.
       switch NextEventType
           case 1
              [InvLevel, TimeNextEvent] = orderArrival(InvLevel, TimeNextEvent, amount);
                counter
           case 2
              [InvLevel, TimeNextEvent] = demandFunction(InvLevel, TimeNextEvent, ProbDistribDemand,  MeanInterDemand, SimTime);
                counter
           case 4
              [TotalOrderingCost, TimeNextEvent, amount] = evaluateFunction(TotalOrderingCost, TimeNextEvent, amount, bigs, smalls, InvLevel, SetupCost, IncrementalCost, SimTime, Minlag, Maxlag);

           case 3
               reportFunction(TotalOrderingCost, NumMonths, HoldingCost, AreaHolding, AreaShortage, ShortageCost, smalls, bigs, outfile);
       end
    end
end
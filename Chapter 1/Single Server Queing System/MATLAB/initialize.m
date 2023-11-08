function [simTime, serverStatus, numInQ, timeLastEvent, ...
    numCustsDelayed, totalOfDelays, areaNumInQ, areaServerStatus, ...
    timeNextEvent] = initialize(meanInterarrival)
    global Q_LIMIT
    global BUSY
    global IDLE
    %Initialize the simulation clock.
    simTime = 0.0;
    %Initialize the state variables.
    serverStatus = IDLE;
    numInQ = 0;
    timeLastEvent = 0.0;
    %Initialize the statistical counters.
    numCustsDelayed = 0;
    totalOfDelays = 0;
    areaNumInQ = 0;
    areaServerStatus = 0;
    %Initialize event list. Since no customers are present, the departure
    %(service comletion) event is eliminated from consideration.
    timeNextEvent(1) = simTime + expon(meanInterarrival);
    timeNextEvent(2) = 1e+30;
end


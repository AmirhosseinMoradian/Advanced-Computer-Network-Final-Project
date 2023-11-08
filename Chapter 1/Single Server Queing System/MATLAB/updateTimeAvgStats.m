function  [timeLastEvent, areaNumInQ, areaServerStatus] = updateTimeAvgStats(timeLastEvent, areaNumInQ, areaServerStatus, simTime, numInQ, serverStatus)
    global Q_LIMIT
    global BUSY
    global IDLE
    
    %Update area accumulators for time-average statistics.
    %Compute time since last event, and update last-event-time maker.
    timeSinceLastEvent = simTime - timeLastEvent;
    timeLastEvent      = simTime;
    %update area under number-in-queue function.
    areaNumInQ = areaNumInQ + numInQ * timeSinceLastEvent;
    % Update area under server-busy indicator function.
    areaServerStatus = areaServerStatus + serverStatus * timeSinceLastEvent;
end


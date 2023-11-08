function [timeNextEvent, numInQ, timeArrival, totalOfDelays, numCustsDelayed, serverStatus] = arrive(timeNextEvent, numInQ, timeArrival, simTime, totalOfDelays, numCustsDelayed, serverStatus, meanInterarrival, outfile, meanService)
    global Q_LIMIT
    global BUSY
    global IDLE
%     Schedule next arrival.
    timeNextEvent(1) = simTime + expon(meanInterarrival);
%     Check to see whether server is busy.
    if(serverStatus == BUSY)
%     Server is busy, so increament number of customer in queue.
        numInQ = numInQ + 1;
%         Check to see whether an overflow condition exists.
        if(numInQ > Q_LIMIT)
%             The queue has overflowd, so stop the simulation.
            fprintf(outfile, '\nOverflow of the array timeArrival at');
            fprintf(outfile, ' time %f', simTime);
            exit(2);
        end
        %There is still room in the queue, so store the time of arrival of
        %the arriving customer at the (new) end of timeArrival.
        timeArrival(numInQ) = simTime;
    else
        %Server is idle, so arriving customer has a delay of zero. (The following two statements are for program clarity and do not affect the results of the simulation.
        delay = 0;
        totalOfDelays = totalOfDelays + delay;
        % Increment the number of customers delayed, and make server busy.
        numCustsDelayed = numCustsDelayed + 1;
        serverStatus = BUSY;
%         Schedule a departure (service completion).
        timeNextEvent(2) = simTime + expon(meanService);
        timeArrival = timeArrival;
    end
end


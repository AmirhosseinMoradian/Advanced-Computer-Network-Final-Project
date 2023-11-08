function [numInQ, serverStatus,  timeArrival, totalOfDelays, numCustsDelayed, timeNextEvent] = depart(numInQ, serverStatus, simTime, timeArrival, totalOfDelays, numCustsDelayed, timeNextEvent, meanService)
    global Q_LIMIT
    global BUSY
    global IDLE
%     Check to see whether the queue is empty.
    if(numInQ == 0)
        % The queue is empty so make the server idle and eliminate the
        % departure (service completion) event from consideration.
        serverStatus = IDLE;
        timeNextEvent(2) = 1e+30;
    else
%        The queue is nonempty, so decrement the number of customers in queue.
        numInQ = numInQ - 1;
        % Compute the delay of the customer who is beginning service and
        % update the total delay accumulator.
        delay  = simTime - timeArrival(1);
        totalOfDelays = totalOfDelays + delay;
        % Increment the number of customers delayed, and schedule
        % departure.
        numCustsDelayed = numCustsDelayed + 1;
        timeNextEvent(2) = simTime + expon(meanService);
        % Move each customer in queue (if any) up one place.
        for i = 1: numInQ
            timeArrival(i) = timeArrival(i + 1);
        end
    end
end


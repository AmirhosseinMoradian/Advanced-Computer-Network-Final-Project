function [simTime, nextEventType] = timing(simTime, outfile, numEvents, timeNextEvent)
    minTimeNextEvent = 1e+29;
    nextEventType = 0;
    for i = 1: numEvents
        if (timeNextEvent(i) < minTimeNextEvent)
            minTimeNextEvent = timeNextEvent(i);
            nextEventType = i;
        end
    end
%     check to see whether the event list is empty.
    if(nextEventType == 0)
%         The event list is empty, so stop simulation.
        fprintf(outfile, '\nEvent list empty at time %f', simTime);
        exit(1);
    end
%     The event list is not empty, so advance the simulation clock.
    simTime = minTimeNextEvent;
end


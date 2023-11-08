function report(outfile, totalOfDelays, numCustsDelayed, areaNumInQ, simTime, areaServerStatus)
    %report generator function.
    %Compute and write estimates of desired meansures of performace.
    fprintf(outfile, '\n\nAverage delay in queue %11.3f minutes\n\n', ...
        totalOfDelays / numCustsDelayed);
    totalOfDelays
    numCustsDelayed
    fprintf(outfile, 'Average number in queue %10.3f\n\n', ...
        areaNumInQ / simTime);
    areaNumInQ
    simTime
    fprintf(outfile, 'Server utilization %15.3f\n\n', ...
        areaServerStatus / simTime);
    areaServerStatus
    simTime
    fprintf(outfile, 'Time simulation ended %12.3f minutes', simTime);
    
    
end


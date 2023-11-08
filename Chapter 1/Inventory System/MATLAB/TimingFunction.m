%Timing function.
function [TimeNextEvent, SimTime , NextEventType] = TimingFunction(TimeNextEvent, NumEvents)

MinTimeNextEvent = 1.0e+29;
NextEventType = 0;

%Determine the event type of the next 
% event to occur.

for i = 1:NumEvents
  if(TimeNextEvent(i) < MinTimeNextEvent)

      MinTimeNextEvent = TimeNextEvent(i);
      NextEventType = i;
  end
end

%Check to see whether 
% the event list is empty.

if NextEventType == 0
%The event list is empty, 
% so stop the simulation

fprintf(outfile, "\nEvent list empty at time %f", SimTime);
exit(1);
end

% The event list is not empty, so advance the 
% simulation clock.

SimTime = MinTimeNextEvent;

end
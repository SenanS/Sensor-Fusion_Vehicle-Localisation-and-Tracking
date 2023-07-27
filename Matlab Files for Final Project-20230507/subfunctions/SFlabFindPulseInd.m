function [pulseInd] = SFlabFindPulseInd(yf,n_pulse,minDist)

% Minimum distance between pulses
minDist = round(minDist);
% Allocate memory
pulseInd = zeros(1,n_pulse);

for k = 1:n_pulse
    % find max point
    [tmp1,maxInd]=max(yf);
    % Save index
    pulseInd(k) = maxInd(1);
    % Set area around max point to zero
    indMin = max([1 pulseInd(k)-minDist]);
    indMax = min([pulseInd(k)+minDist length(yf)]);
    yf(indMin:indMax) = 0;
end
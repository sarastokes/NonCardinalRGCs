function snr = getFourierSNR(hzs, data, stimFrequency, noiseFrequencies)
% GETFOURIERSNR
%
% Description:
%   Get the SNR of the amplitude at the modulation frequency
%
% Syntax:
%   snr = getFourierSNR(hzs, data, stimFrequency, noiseFrequencies)
% --------------------------------------------------------------------------

    arguments
        hzs                         double      {mustBeVector}
        data                        double      {mustBeVector}
        stimFrequency (1,1)   double
        noiseFrequencies    (1,2)   double = [0.35 0.55]
    end

    modAmp = data(findclosest(hzs, stimFrequency));

    rangeIdx = find(hzs >= noiseFrequencies(1) & hzs <= noiseFrequencies(2));
    noiseAvg = mean(data(rangeIdx(1):rangeIdx(2)));
    noiseSD = std(data(rangeIdx(1):rangeIdx(2)));

    snr = (modAmp - noiseAvg) / noiseSD;
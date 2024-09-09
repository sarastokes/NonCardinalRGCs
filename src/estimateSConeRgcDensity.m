function D = estimateSConeRgcDensity(pS, pMidget, N)
% ESTIMATESCONERGCDENSITY
%
% Syntax:
%   D = estimateSConeRgcDensity(pS, pMidget, N)
%
% Inputs:
%   pS          double (0 - 1), vector
%       The proportion of cones that are S-cones
%   pMidget     double (0 - 1), scalar
%       The proportion of ganglion cells that are midget RGCs
%   N           double (0 - 1), scalar
%       The measured or predicted number of RGCs per S-cone
%
% Outputs:
%   D           double (0 - 1)
%       The proportion of ganglion cells that are the target RGC type
%
% See also:
%   rgcPerConeEstimate
%
% References:
%   Equations 4 and 5

% History:
%   20Feb2023 - SSP
% -------------------------------------------------------------------------

    arguments
        pS       (1,:)      double     {mustBeInRange(pS, 0, 1)}
        pMidget  (1,1)      double     {mustBeInRange(pMidget, 0, 1)}
        N        (1,1)      double     {mustBeNonnegative} = 1
    end

    rgc2cone = (2 * (1 - pS) + pS) / pMidget;
    D = (N * pS) ./ rgc2cone;

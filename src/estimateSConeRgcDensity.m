function D = estimateSConeRgcDensity(pS, pMidget, N)
% ESTIMATESCONERGCDENSITY
%
% Syntax:
%   D = estimateSConeRgcDensity(pS, pMidget, N)
%
% Inputs:
%   pS          double (0 - 1)
%       The proportion of cones that are S-cones
%   pMidget     double (0 - 1)
%       The proportion of ganglion cells that are midget RGCs
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
%
% -------------------------------------------------------------------------
    arguments
        pS       double     {mustBeInRange(pS, 0, 1)}
        pMidget  double     {mustBeInRange(pMidget, 0, 1)}
        N        double     {mustBeNonnegative} = 1
    end

    rgc2cone = (2 * (1 - pS) + pS) / pMidget;
    D = (N * pS) / rgc2cone;

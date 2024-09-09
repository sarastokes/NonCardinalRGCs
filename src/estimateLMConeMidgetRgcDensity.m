function [totalPct, midgetPct] = estimateLMConeMidgetRgcDensity(pS, pMidget)
% ESTIMATELMCONEMIDGETRGCDENSITY
%
% Description:
%   Estimate the density of L/M-cone center midget RGCs from two parameters:
%   the density of S-cones and the density of midget RGCs. The calculations
%   assume 1:1 connections between cones and midget RGCs. As a result, this
%   approach is only valid for the fovea and central retina.
%
% Syntax:
%   [totalPct, midgetPct] = estimateLMConeMidgetRgcDensity(pS, pMidget)
%
% Inputs:
%   pS          double (0 - 1)
%       The proportion of cones that are S-cones
%   pMidget     double (0 - 1)
%       The proportion of ganglion cells that are midget RGCs
%
% Outputs:
%   totalPct
%       The proportion of ganglion cells that are L/M-cone midget RGCs
%   midgetPct
%       The proportion of midget RGCs that have L/M-cone centers
%
% Example:
%   [totalPct, midgetPct] = estiomateLMConeMidgetDensity(0.05, 0.86)
%
% See also:
%   estimateSConeRgcDensity
%
% History:
%   20Dec2023 - SSP
% --------------------------------------------------------------------------

    arguments
        pS          double      {mustBeInRange(pS, 0, 1)}
        pMidget     double      {mustBeInRange(pMidget, 0, 1)}
    end

    LM = 2 * (1 - pS);
    midgetPct = LM / (LM + pS);
    totalPct = pMidget * midgetPct;
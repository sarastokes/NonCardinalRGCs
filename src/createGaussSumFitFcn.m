function [fitFcn, eqn] = createGaussSumFitFcn(numNeighbors)
% CREATEGAUSSSUMFITFCN
%
% Syntax:
%   [fitFcn, eqn] = createGaussSumFitFcn(numNeighbors)
%
%  Parameters that are determined by the data:
%   - numNeighbors: the number of neighboring cells
%   - x0y0: the xy coordinates of the center of each cell.
%   - bkgd: the minimum value in the image
%  Parameters that are fit:
%   - a, sx: the amplitude and standard deviation of each Gaussian
% --------------------------------------------------------------------------

    header = "@(";
    eqn = "";
    for i = 1:numNeighbors
        eqn = eqn + sprintf("a%u*(exp(-(x-x0y0(%u,1)).^2./(2.*sx%u.^2) - (y-x0y0(%u,2)).^2./(2.*sx%u.^2)))", i, i, i, i, i);
        if i < numNeighbors
            eqn = eqn + sprintf(" + ...\n");
        end
        header = header + sprintf("a%u, sx%u, ", i, i);
    end
    eqn = eqn + sprintf(" + bkgd");
    header = header + sprintf("x, y) ...\n");
    eqn = header + eqn;

    fitFcn = str2func(eqn);

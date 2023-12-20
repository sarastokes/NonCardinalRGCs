function [h, p, stat] = runKSTest(a, b, opts)
% RUNKSTEST
%
% Description:
%   Wrapper for kstest2 that performs a two-sample Kolmogorov-Smirnov test.
%   This function reports the results to the command line, checks the sample
%   size, and optionally plots the empirical CDFs.
%
% Syntax:
%   [h, p, stat] = runKSTest(a, b, opts)
%
% Inputs:
%   a, b       double (vector)
%       Data to compare
% Optional key/value inputs:
%   TargetSign  string      {"positive", "negative", "none"}
%       Whether to test just data above/below zero (default = "none")
%   Plot        logical
%       Whether to plot the empirical CDFs (default = false)
%
% See also:
%   kstest2, ecdf

% History:
%   05Nov2023 - SSP
% -------------------------------------------------------------------------

    arguments
        a       double      {mustBeVector}
        b       double      {mustBeVector}
        opts.TargetSign     {mustBeMember(opts.TargetSign, ["positive", "negative", "none"])} = "none"
        opts.Plot   logical = false
    end

    % Option to test just data above or below zero
    if nargin > 2
        if opts.TargetSign == "positive"
            a(a < 0) = [];
            b(b < 0) = [];
        elseif opts.TargetSign == "negative"
            a(a > 0) = [];
            b(b > 0) = [];
        end
    end

    % Is the sample size sufficient?
    nA = numel(a); nB = numel(b);
    N = (numel(a) * numel(b)) / (numel(a) + numel(b));
    fprintf('Comparing %u and %u samples (N = %.1f)\n', nA, nB, N);

    if N < 4
        warning('Test will be unreliable due to small sample size!');
    end

    % Perform the test
    [h, p, stat] = kstest2(a, b);

    % Report results, plot if requested
    fprintf('\th = %d,  p = %.3f,  stat = %.4f\n', h, p, stat);

    if opts.Plot
        ax = axes('Parent', figure());
        hold on; grid on;
        [yA, xA] = ecdf(a);
        [yB, xB] = ecdf(b);
        plot(xA, yA, 'Color', 'b', 'LineWidth', 2);
        plot(xB, yB, 'Color', 'r', 'LineWidth', 2);
        ax.YLim(1) = 0;
        if opts.TargetSign == "positive"
            ax.XLim(1) = 0;
        elseif opts.TargetSign == "negative"
            ax.XLim(2) = 0;
        end
        figPos(gcf, 0.8, 0.5);
    end
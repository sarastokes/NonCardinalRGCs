%% Figure 6

% The upper and lower bounds on S-cone density from digitized figure
% See sconeDensityMacaqueFovea.m for details
sconeDensityA = 0.03;
sconeDensityB = 0.05;

% This value comes from transcriptomics data taken from many macaque foveas
% so it minimizes some of the potential variability that may arise in other
% estimates that are either fit largely to peripheral data or are derived
% from a single region of a single fovea.
midgetDensity_Peng2019 = 0.86;
% However, we can check a range of values to see this parameter's impact.
% The midget RGC range is begins at 80% and ends at 92%. While some prior
% estimates place midget RGCs higher, 92% is the maximum value that can
% accommodate reported densities of parasol and small bistratified RGCs.
midgetDensityRange = 0.8:0.01:0.92;

%% Estimate the number of RGCs per foveal cone
% Here is the relationship between midget RGC density and RGC:cone ratio
% for the upper and lower bounds on S-cone density.
rgcPerCone_FinalA = rgcPerConeEstimate(sconeDensityA, midgetDensity_Peng2019);
rgcPerCone_FinalB = rgcPerConeEstimate(sconeDensityB, midgetDensity_Peng2019);
rgcPerConeA = rgcPerConeEstimate(sconeDensityA, midgetDensityRange);
rgcPerConeB = rgcPerConeEstimate(sconeDensityB, midgetDensityRange);

figure(); hold on;
plot(midgetDensityRange, rgcPerConeA,...
     'Color', hex2rgb('00cc4d'), 'LineWidth', 2);
plot(midgetDensityRange, rgcPerConeB,...
     'Color', hex2rgb('334de6'), 'LineWidth', 2);
plot([midgetDensity_Peng2019, midgetDensity_Peng2019],...
     [rgcPerCone_FinalA, rgcPerCone_FinalB],...
     '.k', 'MarkerSize', 20);
xlabel('Midget RGC Density (%)');
ylabel('RGCs Per Foveal Cone');
figPos(gcf, 0.6, 0.6);

%% Estimate the density of S-OFF midget RGCs (or small bistratified RGCs)
% There's definitely 1 S-OFF midget RGC per S-cone. There's thought to be
% one small bistratified RGC per S-cone as well even though each one gets
% input from multiple S-cones. A good thing about the model is that it's
% agnostic to the underlying circuitry.
smidgetDensityA = sconeRgcDensityEstimate(sconeDensityA, rgcPerConeA, 1);
smidgetDensityB = sconeRgcDensityEstimate(sconeDensityB, rgcPerConeB, 1);
smidgetDensity_FinalA = sconeRgcDensityEstimate(sconeDensityA, rgcPerCone_FinalA, 1);
smidgetDensity_FinalB = sconeRgcDensityEstimate(sconeDensityB, rgcPerCone_FinalB, 1);

figure(); hold on;
plot(midgetDensityRange, smidgetDensityA,...
     'Color', hex2rgb('00cc4d'), 'LineWidth', 2);
plot(midgetDensityRange, smidgetDensityB,...
     'Color', hex2rgb('334de6'), 'LineWidth', 2);
plot([midgetDensity_Peng2019, midgetDensity_Peng2019],...
    [smidgetDensity_FinalA, smidgetDensity_FinalB],...
    '.k', 'MarkerSize', 20);
xlabel('Midget RGC Density (%)');
ylabel('S-cone RGC Density (%)'); ylim([1 2.5]);
figPos(gcf, 0.6, 0.6);

%% Compare predictions with small bistratified RGC data and S-ON neurons
% Make a plot
digitizedSmallBistratifiedDensity_Dacey1993_Fig13D();
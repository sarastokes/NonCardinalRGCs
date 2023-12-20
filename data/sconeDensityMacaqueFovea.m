% Reports of S-cone densities in the macaque fovea

%% De Monasterio et al (1985)
sCone = dlmread('macaqueSConeDensity_deMonasterio1985.txt');

% Let's do just the first 1st mm which is generous for our imaging region
regionEnd = findclosest(sCone(:,1), 1);
avgDensity_1mm = mean(sCone(1:regionEnd,2));  % 3.68
% First 500 um is more realistic.
regionEnd = findclosest(sCone(:,1), 0.5);
avgDensity_500um = mean(sCone(1:regionEnd,2));  % 2.42
% The final 0.3 used in the text is will slightly overestimate the lower
% bound but I'm not confident these digitized datasets are accurate out to
% 2 significant digits anyway.

%% Klug et al (2003) J Neurosci
% In a region with 113 cones, there were 5 S-cones
sConeDensity_Klug2003 = 5 / 118;  % 4.24
% This falls within the density range from de Monasterio et al (1985) and
% Martin and Grunert (2006) used in the text.

%% Peng et al (2019) Cell
lmConeDensity_Peng2019 = 4.367049066368E-1;
sConeDensity_Peng2019 = 2.528679977587E-2;
% The figure (3B) included rods so the proporitions need to be adjusted
coneDensity_Peng2019 = [sConeDensity_Peng2019, lmConeDensity_Peng2019];
coneDensity_Peng2019 = coneDensity_Peng2019 / sum(coneDensity_Peng2019);

% I didn't see a density estimate in the paper so I digitized Figure 3E. As
% above, I wouldn't trust the digitizing process far, so once rounded, this
% is within range.
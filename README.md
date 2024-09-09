# Non-Cardinal Foveal Ganglion Cells
Code related to paper on retinal neurons with rare L vs. M+S and M vs. L+S cone opponency. A preprint is available on bioRxiv.

>Tyler Godat, Kendall Kohout, Keith Parkins, Qiang Yang, Juliette McGregor, William  Merigan, David Williams, Sara Patterson (202x) Cone-opponent ganglion cells tuned to non-cardinal color directions in the primate fovea.

#### Code
Walkthroughs of the logic for the model functions can be found in the `docs` folder.
- `estimateRgcConeRatio`: Estimate RGC:cone ratio from S-cone density and the proportion of ganglion cells that are midget RGCs.
- `estimateSConeRgcDensity`: Estimate the density of an RGC type based on a measurement/ prediction of the average number of the RGC type per S-cone. Requires S-cone density and RGC:cone ratio.
- `estimateLMConeMidgetRgcDensity`: Estimate the density of L/M-cone center midget RGCs from two parameters: S-cone density and the density of midget RGCs. Logic follows previous calculations but does not require an estimate of the RGC:cone ratio.
- `runKSTest`: Two-sided Kolmogorov-Smirnov test. This wraps MATLAB's `kstest2`, adding sample size check and plotting.
- `createGaussSumFitFcn`: creates a fit function for the optical crosstalk model. More details can be found in Tyler's OSF repository
- `getFourierSNR`: function for calculating the SNR of the Fourier amplitude at the modulation frequency. More details can be found in Tyler's OSF repository.

Note that the density estimate calculations rely on the stereotyped circuitry of midget RGCs present in the fovea and central retina (2 midget RGCs per L/M-cone, 1 midget RGC per S-cone; Calkins et al., 1994 and Klug et al., 2003). As a result, this approach is only valid for eccentricities where there are 1:1 connections between cones, midget BCs and midget RGCs.

#### Digitized datasets
- `digitizedSmallBistratifiedDensity_Dacey1993_Fig13D.m`: Small bistratified RGC density for macaque up to 10 mm eccentricity (temporal)
- `sconeDensityMacaqueFovea.m`: S-Cone density estimates for the macaque fovea.

#### Requirements
The code was developed in MATLAB 2023a.

#### See also
Tyler Godat's work is available on OSF along with Keith's Fourier analysis software (https://osf.io/s9qw4).

#### References
- Calkins et al (1994) M and L cones in macaque fovea connect to midget ganglion cells by different numbers of excitatory synapses. _Nature_, 371, 70-72
- Calkins (2001)Seeing with S cones. _Progress in Retinal and Eye Research_, 20(3), 255-283
- Dacey et al (1993) Morphology of a small-field bistratified ganglion cell type in the macaque and human retina. _Visual Neuroscience_, 10(6), 1080-1098
- De Monasterio et al (1985) Density profile of blue-sensitive cones along the horizontal meridian of macaque retina. _Investigative Ophthalmology and Visual Science_, 26(3), 289-302
- Klug et al (2003) Macaque retina contains an S-cone OFF midget pathway. _Journal of Neuroscience_, 23(30), 9881-9887
- Martin & Grunert (1999) Analysis of the short wavelength-sensitive ("blue") cone mosaic in the primate retina: comparison of New World and Old World Monkeys _Journal of Comparative Neurology_, 14, 1-14
- Peng et al (2019) Molecular classification and comparative taxonomics of foveal and peripheral cells in primate retina. _Cell_, 176(5), 1222-1237
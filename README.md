# Non-Cardinal RGCs
Code related to paper on retinal neurons with rare L vs. M+S and M vs. L+S cone opponency.

>Godat, Kohout, Parkins, Yang, McGregor, Merigan, Williams, Patterson (in revision) Cone-opponent ganglion cells tuned to non-cardinal color directions in the primate fovea.

#### Code
- `rgcPerConeEstimate`: Estimate RGC:cone ratio from S-cone density and the proportion of ganglion cells that are midget RGCs.
- `estimateSConeRgcDensity`: Estimate the density of an RGC type based on a measurement/ prediction of the average number of the RGC type per S-cone. Requires S-cone density and RGC:cone ratio. Logic is detailed in `sConeDensityEstimate`.
- `estimateLMConeMidgetRgcDensity`: Estimate the density of L/M-cone center midget RGCs from two parameters: S-cone density and the density of midget RGCs. Logic follows previous calculations but does not require an estimate of the RGC:cone ratio.
- `runKSTest`: Two-sided Kolmogorov-Smirnov test. This wraps MATLAB's `kstest2`, adding sample size check and plotting.

Note that the density estimate calculations rely on the stereotyped circuitry of midget RGCs present in the fovea and central retina (2 midget RGCs per L/M-cone, 1 midget RGC per S-cone; Calkins et al., 1996 and Klug et al., 2003). As a result, this approach is only valid for eccentricities where there are 1:1 connections between cones, midget BCs and midget RGCs.

#### Digitized datasets
- `digitizedSmallBistratifiedDensity_Dacey1993_Fig13D.m`: Small bistratified RGC density for macaque up to 10 mm eccentricity (temporal)
- `digitizedSConeDensity_Calkins2001.m`: S-Cone density from Calkins (2001). The original data is from Martin & Grunert (1999) and De Monasterio (1985). Several other datasets are compared and confirmed to fall with the 3-5% range used in the manuscript.

#### See also
Tyler Godat's work is available on OSF along with some of the in-house software used for Fourier analysis (https://osf.io/s9qw4).

#### References
- Calkins et al (1996) _Nature_
- Calkins (2001) _Prog Ret Eye Res_
- Dacey et al (1993) _Visual Neuroscience_
- De Monasterio et al (1985) _Investigative Ophthalmology and Visual Science_
- Klug et al (2003) _J Neurosci_
- Martin & Grunert (1999) _Journal of Comparative Neurology_
- Peng et al (2019) _Cell_
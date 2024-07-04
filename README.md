# flm-EnergyLandscape-rTMS
this code was uploaded to replicate the main results in "The alterations of repetitive transcranial magnetic stimulation on energy landscape of resting state networks differ across human cortex" by Liming Fan
# software requirements
the matlab scripts have been tested on Matlab R2018b, it has not been tested for any other Matlab version.
To run the energy landscape analysis, the "Energy landscape analysis toolbox (ELAT)" was also required. It can be downloaded from https://github.com/tkEzaki/energy-landscape-analysis.git
# user guide
To run the energy landscape analysis, you need to download ELAT toolbox and unzip it. Add the folder named "energy-landscape-analysis-master" with all functions to this repository. Changing the path of ELAT in flm_ELA.m and run it.
To replicate the main results, Figure 3A, 3C, 4E, 4G, 4I can be made by running get_figure.m, Figure 7 can be made by running get_Figure7.m, Figure 5A and 6 can be made by running path_cost.m. The relationships between brain dynamics and functional segregation in Figure 8 can be calculated using get_func2dym_corr.m. The statistical analysis of state dynamics among three groups can be calculated using get_mean_base_dym_stat.m. 
# data
FRO_func_seg.mat, OCC_func_seg.mat, Base_func_seg.mat saved the functional connectivity within and between modules. For example, "across_module16" saved the mean FC value between module1 and 6, "within_module16" saved the mean FC value within module1 and 6. 
bi_TS.mat saved the concatenated binary time series from Baseline, postFRO and postOCC.  
minimum_path_cost.mat saved minimum path and cost. 
Mean_Base_dym.mat postFROdym.mat postOCCdym.mat saved all the results from energy landscape analysis. 
# other functions
permutation_htest2_np.m was cited to do statistical analysis between two groups using permutation t-test.
Violin.m and violinplot.m were cited to made violin plot. 

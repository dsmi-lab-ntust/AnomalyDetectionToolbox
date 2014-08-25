For contextual anomaly, we queried climate data from NOAA's National Climatic Data Center (NCDC). This data set records the climate data from the station of Taiwan. We perturb the climate data contextual to convert normal data to contextual anomalies inside. This processing will switch temperatures of different seasons as contextual anomalies. 

With WMO Resolution 40 NOAA Policy, this data set cannot be redistributed for commercial purposes. Re-distribution of these data by others must provide this same notification.
For details, please consult:
http://www.wmo.int/pages/about/Resolution40.html

The hourly climate data set is a subset from http://www7.ncdc.noaa.gov/CDO/cdopoemain.cmd?datasetabbv=DS3505&countryabbv=&georegionabbv=&resolution=40
, where the original station name is CHIANG KAI SHEK in Taiwan. The time is selected from 2008/1/31 to 2013/12/13. The matlab code "pretub.m" will inject contextual anomalies in this data set. The detatil is described in the corresponding code file.


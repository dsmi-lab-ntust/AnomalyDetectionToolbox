HOTSAX is used to detect anomaly in a timeseries data.

The meaning of every parameters are in HOTSAX.m

The useage of HOTSAX function can be seen in HOTSAX_example.m
Dataset used in the example is from "Space Shuttle dataset".

timeseries2symbol.m is what we called "SAX" which can transform a timeseries data into symbol.
The copyright of this function can be seen in the code.



DC is used to detect anomaly in a very large timeseries data. It detects outliers (or discord) cross dataset files. DC_example.m shows the usage of this method. Note it may not give intuitive result for one dimension data. ex) for temperature data, the very high value will not be a outlier when this value has enough nearest neighbors like (25 24 24 23 24 26 1000 25 1000 1000).
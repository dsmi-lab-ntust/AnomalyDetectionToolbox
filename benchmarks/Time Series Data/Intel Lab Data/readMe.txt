Intel Lab Data is a public data set collected from 54 sensors deployed in the Intel Berkeley Research lab between February 28th and April 5th, 2004.

In this modified data set, we only remain sensor reading attributes of original data set, i.e. humidity, temperature, and light. 
Although there is no anomaly ground truth in original data set, we can still recognize and manually label some obvious anomalies in original data set.
When abnormality occurs, sensor reading will be obvious high or low. Abnormality of each sensor has different patterns from others. We choose whole day's data from February 28th. We selected sensor 1, 6, 9, 10, 12, 13, 28, and 29 as normal sensor.
For testing, we selected sensor 33, 37, 39, 52, 53 as unseen normal sensor, and 2, 3, 8, 11, 15, 16 are selected as unseen abnormal sensor.

Original dataset can be downloaded from:
http://db.csail.mit.edu/labdata/labdata.html
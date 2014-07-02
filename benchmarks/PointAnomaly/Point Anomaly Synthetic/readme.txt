For point anomaly, we provide synthetic data generator of point anomaly. Follow the definition of point anomalies in [1], the synthetic data generator will produce normal points under Gaussian mixture distribution with random means and random variances in high dimensionality space, and consider points generated from uniform distribution as point anomaly.

For evaluation, you can simply use "PointAnomalySyntheticData.csv" and "PointAnomalySyntheticLabel.csv" to evaluate your algorithm. Those files are generated from PointAnomalyGen( 2000,50,20 ).

Kriegel, Hans-Peter, and Arthur Zimek. "Angle-based outlier detection in high-dimensional data." Proceedings of the 14th ACM SIGKDD international conference on Knowledge discovery and data mining. ACM, 2008.
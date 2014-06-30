%Load test data
data = csvread('..\benchmarks\PointAnomaly\PointAnomalySyntheticData.csv');
label = csvread('..\benchmarks\PointAnomaly\PointAnomalySyntheticLabel.csv');


process(data, label, 5, 1)
process(data, label, 5, 1.5)
process(data, label, 5, 2)


process(data, label, 11, 1)
process(data, label, 11, 1.5)
process(data, label, 11, 2)

process(data, label, 21, 1)
process(data, label, 21, 1.5)
process(data, label, 21, 2)

process(data, label, 31, 1)
process(data, label, 31, 1.5)
process(data, label, 31, 2)

process(data, label, 41, 1)
process(data, label, 41, 1.5)
process(data, label, 41, 2)

process(data, label, 51, 1)
process(data, label, 51, 1.5)
process(data, label, 51, 2)
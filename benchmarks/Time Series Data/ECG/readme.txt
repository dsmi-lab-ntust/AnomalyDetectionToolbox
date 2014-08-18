For collective anomaly, we provides a real-world ECG dataset and synthetic data generator as benchmarks. 
Premature Atrial Contraction (PAC) can be considered as typical collective anomaly. 
A cycle of human heart beat includes P, Q, R, S, T wave. Premature Atrial Contraction will make the waveforms of a cycle being anomaly. 

This EGC data is a subset from record 100 of MIT-BIH Arrhythmia Database, the information is described in 
Moody GB, Mark RG. The impact of the MIT-BIH Arrhythmia Database. IEEE Eng in Med and Biol 20(3):45-50 (May-June 2001). (PMID: 11446209)
Please cite this publication when referencing this material, and also include the standard citation for PhysioNet:
Goldberger AL, Amaral LAN, Glass L, Hausdorff JM, Ivanov PCh, Mark RG, Mietus JE, Moody GB, Peng C-K, Stanley HE. PhysioBank, PhysioToolkit, and PhysioNet: Components of a New Research Resource for Complex Physiologic Signals. Circulation 101(23):e215-e220 [Circulation Electronic Pages; http://circ.ahajournals.org/cgi/content/full/101/23/e215]; 2000 (June 13).
This subset only remain the label of premature atrial contractions (PACs). The label will be "1" when a PAC is detected.
Even each PAC event is only labeled on one stamp, the PAC event may effect one or two whole cycles time.   
Original database also records other kinds of event, such as premature ventricular contraction.

We also include a synthetic ECG data generator from [1]. 
The data generator is able to generate a synthetic ECG data with regular pattern. 
A qualified collective anomaly detection algorithm should be able to learn the regular pattern from the generated synthetic data.


[1] McSharry, Patrick E., et al. "A dynamical model for generating synthetic electrocardiogram signals." Biomedical Engineering, IEEE Transactions on 50.3 (2003): 289-294.
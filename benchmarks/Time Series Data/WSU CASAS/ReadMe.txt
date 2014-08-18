The original dataset is extracted from WSU CASAS Datasets, which records normal daily activities of two married residents. The sensors in the environment is located as in the "Tulum_Sensor_Map.png." 
We assume that, daily lifestyle of each family should be regular, especially early in the morning. If the motion sensors are abnormally triggered, it should be considered as anomaly.
Each row in "ADLNormal" records the sequential daily triggered motion sensors in 4 a.m. per day, and "ADLUseen" records the sequential daily triggered motion sensors of non-specific hour of a day.
The "ADLLabel" file provides the ground truth of unseen sequence, where "0" indicates the sequential data in 4 a.m. of a day, and "1" indicates the sequential data from other hours.

Each symbol in the dataset represents a motion sensor in the original environment as following list:

a->M01
b->M02
c->M03
d->M04
e->M05
f->M06
g->M07
h->M08
i->M09
j->M10
k->M11
l->M12
m->M13
n->M14
o->M15
p->M16
q->M17
r->M18
s->M19
t->M20
u->M21
v->M22
w->M23
x->M24
y->M25
z->M26
1->M27
2->M28
3->M29
4->M30
5->M31

If you want to test your algorithm on this dataset, you should cite the the WSU CASAS smart home project.

D. Cook.  Learning setting-generalized activity models for smart spaces.
IEEE Intelligent Systems, 2011.
'''
Created on 2012/9/19

@author: PatrickYeh
'''
import math
import numpy as np
def getSAX(T,n,w,a):
    dictAugTree = {}
    dictReAugTree = {}
    if a > 20:
        print 'a is too bigger'
    win_size = int(math.floor(n/w))
    
    for i in xrange(0,len(T)-n):
        sub_section = np.transpose(T[i:i+n])
        #print sub_section
        #sub_section = (sub_section - np.average(sub_section)) / np.std(sub_section)
        if n == w:
            PAA = sub_section
        else:
            if (n/w - math.floor(n/w)) >=0:
                temp = np.zeros((w,n))
                #print temp
                for j in xrange(0,w):
                    #print temp[j,:]
                    temp[j,:] = sub_section
                expanded_sub_section = np.reshape(temp, (1, n*w))
                PAA = np.mean(np.reshape(expanded_sub_section,(n,w)),axis=0)
                #print PAA
            else:
                #print sub_section
                #print len(sub_section)
                #print win_size,w
                PAA = np.mean(np.reshape(sub_section,(win_size,w)),axis=0)
                np.reshape
        #print 'PAA:',PAA
        current_string = str(map_to_string(PAA,a))
        
        if dictAugTree.has_key(current_string):
            dictAugTree[current_string].append(i)
        else:
            dictAugTree[current_string] = [i]
        dictReAugTree[i] = current_string
    return dictAugTree,dictReAugTree
def map_to_string(PAA,a_size):
    g_distribute = get_cut_point(a_size)
    string = ['']*len(PAA)
    for i in xrange(0,len(PAA)):
        #print i,PAA[0],g_distribute
        string[i] = str(sum([1 for result in g_distribute if result < PAA[i]]))
    return string

def get_cut_point(a_size):
    g_distribution = [[-np.inf,0],
        [-np.inf,-0.43,0.43],
        [-np.inf,-0.67,0,0.67],
        [-np.inf,-0.84,-0.25,0.25,0.84],
        [-np.inf,-0.97,-0.43,0,0.43,0.97],
        [-np.inf,-1.07,-0.57,-0.18,0.18,0.57,1.07],
        [-np.inf,-1.15,-0.67,-0.32,0,0.32,0.67,1.15],
        [-np.inf,-1.22,-0.76,-0.43,-0.14,0.14,0.43,0.76,1.22],
        [-np.inf,-1.28,-0.84,-0.52,-0.25,0.,0.25,0.52,0.84,1.28],
        [-np.inf,-1.34,-0.91,-0.6,-0.35,-0.11,0.11,0.35,0.6,0.91,1.34],
        [-np.inf,-1.38,-0.97,-0.67,-0.43,-0.21,0,0.21,0.43,0.67,0.97,1.38],
        [-np.inf,-1.43,-1.02,-0.74,-0.5,-0.29,-0.1,0.1,0.29,0.5,0.74,1.02,1.43],
        [-np.inf,-1.47,-1.07,-0.79,-0.57,-0.37,-0.18,0,0.18,0.37,0.57,0.79,1.07,1.47],
        [-np.inf,-1.5,-1.11,-0.84,-0.62,-0.43,-0.25,-0.08,0.08,0.25,0.43,0.62,0.84,1.11,1.5],
        [-np.inf,-1.53,-1.15,-0.89,-0.67,-0.49,-0.32,-0.16,0,0.16,0.32,0.49,0.67,0.89,1.15,1.53],
        [-np.inf,-1.56,-1.19,-0.93,-0.72,-0.54,-0.38,-0.22,-0.07,0.07,0.22,0.38,0.54,0.72,0.93,1.19,1.56],
        [-np.inf,-1.59,-1.22,-0.97,-0.76,-0.59,-0.43,-0.28,-0.14,0,0.14,0.28,0.43,0.59,0.76,0.97,1.22,1.59],
        [-np.inf,-1.62,-1.25,-1,-0.8,-0.63,-0.48,-0.34,-0.2,-0.07,0.07,0.2,0.34,0.48,0.63,0.8,1,1.25,1.62],
        [-np.inf,-1.64,-1.28,-1.04,-0.84,-0.67,-0.52,-0.39,-0.25,-0.13,0,0.13,0.25,0.39,0.52,0.67,0.84,1.04,1.28,1.64]
        ]
    return g_distribution[a_size-2]

#print map_to_string(np.array([0.4,0.7,-1.5,2.4]),3)
#print np.sum(np.sqrt(np.power(np.array([1,2,4]) - np.array([4,5,6]),2)))
#print np.mean(np.reshape([1,2,4,5,6,7,8,9],(4,2)) -2)
T = np.array([1,3,4,5])-np.array([1,3,4,7])
print np.sqrt(np.dot(T,T))
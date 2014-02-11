'''
Created on 2012/9/19

@author: PatrickYeh
'''
#import pylab
import numpy as np
from matplotlib import pyplot as plt

import SAX
import time
from itertools import count, izip
def TimeSeriesDataLoader(strFile,colIndex = 0):
    objFile = open(strFile,'r')
    lstResult = []
    for line in objFile:
        lstLine = [float(value) for value in line.split(' ')]
        lstResult.append(lstLine)
    return np.array(lstResult)
def HOTSAX(T,n):
    objT = np.array(T)
    objT = objT[:,0]
    plt.figure(1)
    plt.plot(objT)
    plt.figure(2)
    plt.plot(objT)
    print 'Len=',len(objT)
    flaBest_So_Far_Dist = [0]*3
    intBest_So_Far_Loc = [-1]*3
    intBestLength = len(intBest_So_Far_Loc)
    intCounter = 0
    startT = time.clock()
    objT = (objT - np.average(objT))/np.std(objT)
    (objAugTree,objReAugTree) = getAugTree(T,n)
    #print objAugTree
    objOuter = getHeuOuter(objAugTree)
    print 'Outer Count:',len(objOuter)
    objRandomOuter = objOuter[:]
    np.random.shuffle(objRandomOuter)
    #print 'Random',objRandomOuter
    
    for p in objOuter:
        flaNearest_Neighbor_Dist = np.Inf
        objInner = getHeuInner(objOuter,objRandomOuter,objAugTree,objReAugTree,p)
        #print 'Inner',objInner
        #objInner.extend(objRandomOuter)
        boolBreak = False
        for q in objInner:
            #print type(p),p,type(q),q
            if abs(p-q) >= n:
                intCounter = intCounter + 1
                dobDistPQ = Dist(objT[p:p+n],objT[q:q+n])
                if len([1 for dist in flaBest_So_Far_Dist if dobDistPQ < dist]) > 0:
                    #boolBreak = True
                    break
                if dobDistPQ < flaNearest_Neighbor_Dist:
                    flaNearest_Neighbor_Dist = dobDistPQ
            else:
                pass
        if not (flaNearest_Neighbor_Dist == np.Inf) and not boolBreak:
            minvalue, minindex = min(izip(flaBest_So_Far_Dist, count()))
            if minvalue < flaNearest_Neighbor_Dist and len([1 for loc in intBest_So_Far_Loc if abs(p - loc) < n]) == 0:
                #print p,intBest_So_Far_Loc[minindex]
                #print minindex,flaNearest_Neighbor_Dist
                flaBest_So_Far_Dist[minindex] = flaNearest_Neighbor_Dist
                intBest_So_Far_Loc[minindex] = p
    print 'Computing Time=',time.clock() - startT
    for loc in intBest_So_Far_Loc:
        if loc == -1:
            break
        plt.plot(np.array(xrange(loc,loc+n)),T[loc:loc+n],'-r')
    plt.show()
    return (intBest_So_Far_Loc,flaBest_So_Far_Dist)
def getAugTree(T,n):
    return SAX.getSAX(T, n, 16, 8)
def getHeuOuter(objAugTree):
    lstPointers = objAugTree.values()
    #print 'lstPointers',lstPointers
    lstPointers.sort(lambda x,y:cmp(len(x),len(y)))
    lstOuter = []
    for items in lstPointers:
        lstOuter.extend(items)
    return lstOuter

def getHeuInner(objOuter,objRandomOuter,objAugTree,objReAugTree,p):
    if p >= 18019:
        print p,objAugTree[objReAugTree[p]]
    if len(objAugTree[objReAugTree[p]]) <= 2:
        print 'enable random',p
        objAugTree[objReAugTree[p]].extend(objRandomOuter)
    return objAugTree[objReAugTree[p]]

def Dist(T1,T2):
    tmpT1SubT2 = T1-T2
    return np.sqrt(np.dot(tmpT1SubT2,tmpT1SubT2))

print HOTSAX(TimeSeriesDataLoader('/Users/PatrickYeh/Dropbox/QQ.txt'),5) 

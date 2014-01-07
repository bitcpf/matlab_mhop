#!/usr/bin/python
# Date: Sep. 30
# Author: Pengfei Cui
# Version: 1.0
# Description: Parse data from Matlab output and write to a txt file


import os
allFileNum = 0
def printPath(level, path):
    global allFileNum
    dirList = []
    files = os.listdir(path)
    dirList.append(str(level))
    for f in files:
        if(os.path.isdir(path + '/' + f)):
            if(f[0] == '.'):
                pass
            else:
                dirList.append(f)
#        if(os.path.isfile(path + '/' + f)):
#            fileList.append(f)
    return dirList

def parse(dirList):
    datalist=[]
    global allFileNum
    i_dl = 0
    fileList=[]
    for dl in dirList:
        if(i_dl ==0):
            i_dl = i_dl + 1
        else:
            temp = str(dl)
            value = temp.split('_')[-1]
#           print value
            path=temp+'/amplr_ga.rt'
            filehandle=open(path,'r')
            content=[x.rstrip("\n") for x in filehandle]
            filehandle.close()
            data=[x[2:] for x in content[1:]]
            data.insert(0,value)
            datalist.append(data)
    return datalist

if __name__== '__main__':
    dirList=printPath(1, './')
    datalist=parse(dirList)
    
    
    f=open('result.txt','w')
    for i in datalist:
        k=''.join([str(j) for j in i])
        f.write(k+"\n")
    f.close()


import os
import re
def walk_dir(dir,fileinfo,topdown=True):
    for root, dirs, files in os.walk(dir, topdown):
        for name in files:
#            print(os.path.join(name))
            fileinfo.write(os.path.join(root,name) + '\n')
            for name in dirs:
#                 print(os.path.join(name))
                 fileinfo.write('  ' + os.path.join(root,name) + '\n')

def finddatafile():
    f=open("list.txt")
    fdata=open('dataf.txt','w')
    line=f.readline()
    while line:
        
        if(re.findall('amplr_obj',line)):
            fdata.write(line)
            #print line,
        line=f.readline()
    f.close()
    fdata.close()


def parseresult():
    fdata=open('dataf.txt')
    line=fdata.readline()
    dataout=open('dataout.txt','w')
    while line:
        line=line.strip('\n')
        datafile=open(line)
        dataline=datafile.readline()
        while dataline:
            if(re.findall('objective',dataline)):
                data=re.findall('[0-9]+\.[0-9]{4,12}',dataline)
                numdata=float("".join(data))/1.5
                dataout.write(str(numdata)+'\n')
                print numdata
            dataline=datafile.readline()
        line=fdata.readline()
        datafile.close()
    fdata.close()
    dataout.close()




dir = raw_input('please input the path:')
fileinfo = open('list.txt','w')
walk_dir(dir,fileinfo)
fileinfo.close()
finddatafile()
parseresult()

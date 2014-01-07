## Author: Pengfei Cui
# Aug. 6th
# Change the AMPL output for Matlab
import re


f = open("test.txt", "r")
g = open("newfile.txt", "w")

for line in f:
    if line.strip():
        g.write(",".join(line.split()[1:]) + "\n")
f.close()
g.close()

f=open("newfile.txt","r")
g=open("trans.txt","w")

for line in f:
    if not "*" in line:
        if not ":" in line:
            g.write(line)


f.close
g.close



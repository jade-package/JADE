#! /usr/bin/env python

import os




class LogParser():
    def __init__(self):

        return

    def state_pop(self):
        """
        open log file and read current state
        """
        mystr = "1 10 103 105 107  108 11 111 113 114 116 117 118 119 120 123 124 125 128 13 130 136 137 138 142 143 145 149 150 151 155 156 158 161 16
4 166  169 17 170 173 174 177 180 181 184 188 189 19 192 193 194 199 200 22 27 29 31 32 33 35 36 37 38 4 40 41 42 45 46 47 48 50 51 52 56 57 6 63 64 65
 7 71 73 77 78 79 82 86 90 93 97 99"
        traj = mystr.split()

        nstep = 600
        ntraj = len(traj)

        s1 = [0 for i in xrange(nstep)]
        s2 = [0 for i in xrange(nstep)]
        s3 = [0 for i in xrange(nstep)]
        mytime = [0 for i in xrange(nstep)]
        for itraj in traj:
            os.chdir(itraj)
            os.system("grep 'current state' hop_all_time.out | awk '{print $2,$5}' > t0")
            fp = open("t0", "r")
            for j in xrange(nstep):
                line = fp.readline()
                if line.strip() == "":
                    continue
                #print i, j, line
                i_state = int(line.split()[1])
                if i_state == 3:
                    s3[j] += 1.0/ntraj
                if i_state == 2:
                    s2[j] += 1.0/ntraj
                if i_state == 1:
                    s1[j] += 1.0/ntraj

            os.chdir("../")

        fp = open("rs.dat", "w")
        for a, b, c in zip(s1,s2,s3):
            print >>fp, "%10.3f%10.3f%10.3f" % (a, b, c)
        fp.close()

        return
        
        
### main program
if __name__ == "__main__":
    log = LogParser()
    log.state_pop()




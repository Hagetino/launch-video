# Loudness per half second, as a bar chart: shows where the build, drop and silence really are.
#   python3 scripts/energy.py audio/music.mp3
import subprocess, sys, array, math
SR=11025
raw=subprocess.run(['ffmpeg','-loglevel','error','-i',sys.argv[1],'-ac','1','-ar',str(SR),'-f','s16le','-'],capture_output=True).stdout
x=array.array('h'); x.frombytes(raw)
W=SR//2
for i in range(0,len(x)-W+1,W):
    seg=x[i:i+W]; r=math.sqrt(sum(v*v for v in seg)/W)
    db=20*math.log10(r/32768+1e-9)
    print("%5.1fs %6.1f dB %s"%(i/SR,db,'#'*max(0,int((db+50)/1.2))))

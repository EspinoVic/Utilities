import psutil
import time
#p = psutil.Process()
p = psutil.Process(27984)
# blocking
#print(p.cpu_percent(interval=1) )
pInf = ""

"""with p.oneshot():

    pInf = pInf + p.name()  # execute internal routine once collecting multiple info
    pInf = pInf +  str(p.cpu_times() ) # return cached value
    pInf = pInf +  str(p.cpu_percent())  # return cached value
    pInf = pInf +  str(p.create_time())  # return cached value
    pInf = pInf +  str(p.ppid())  # return cached value
    pInf = pInf +  str(p.status())  # return cached value"""

#print(pInf)
print("uwu")
for contador in range(1,10):
# non-blocking (percentage since last call)
    #print(p.cpu_percent(interval=1))
    #print(p.cpu_percent(interval=0.1, perCpu = True) )
    print(psutil.cpu_percent(interval=0.1, percpu=False))
    time.sleep(0.1)
    #print(p.cpu_times_percent(interval=1))
import requests
import datetime
import numpy as np

# script to download data from ORFEUS repository.
# if other ORFEUS data is needed, just change the webserver
# take a look at http://webservices.ingv.it/fdsnws/dataselect/1/

# by days
net = 'CH'
stat_lst = ['MOUTI']
firstDate = datetime.datetime(2024,1,1,0,0,0) #yyyy,mm,d,hh,mm,ss
lastDate  = datetime.datetime(2024,3,1,0,0,0)
daySteps  = 1
fD = [firstDate.strftime("%Y-%m-%dT%H:%M:%S")]

#print(fD)
lst_time  = []
date      = firstDate
while date <= lastDate:
    date += datetime.timedelta(days=daySteps)
    lst_time.append(date.strftime("%Y-%m-%dT%H:%M:%S"))
all_datesTimes = np.insert(lst_time, 0, fD, axis=0)
a_time = all_datesTimes.tolist()

#print(a_time)

url1 =  'https://eida.ethz.ch/fdsnws/dataselect/1/query?network='

for i in stat_lst:
    url2 = url1+net+'&station='+i
    #print(url2)
    for j in a_time[0:-1]:
        nextj = a_time[a_time.index(j)-len(a_time)+1]
        url3 = '&channel=HH?&start='+j+'&end='+nextj
        print('retrieving data from: ')
        print(url2+url3)
        #print(i+'.'+j[0:10]+'T'+j[11:13]+':'+j[14:16]+':'+j[17:19])
        r = requests.get(url2+url3, allow_redirects=True)
        open(i+'.'+j[0:10]+'T'+j[11:13]+'.'+j[14:16]+'.'+j[17:19]+'.mseed', 'wb').write(r.content)

import sys
import re
def time_subtr(time,error,type):
  if type=='+':
    err_type=1
  else:
    err_type=-1
  hour=int(time[:2])
  min=int(time[3:5])
  msec=int(time[6:8]+time[9:12])
  tmsecs=3600000*hour+60000*min+msec
  corr=-1*error*err_type
  tmsecs=tmsecs+corr
  if tmsecs>=0:
    nmsec=(tmsecs)%60000
    msec=(5-len(str(nmsec)))*'0'+str(nmsec)
    tmin=(tmsecs-nmsec)/60000
    nmin=int(tmin%60)
    min=str(int(tmin%60))
    if len(min)==1:
      min='0'+min
    hour=str(int((tmin-nmin)/60))
    if len(hour)==1:
      hour='0'+hour
    new_time=hour+':'+min+':'+msec[:2]+','+msec[2:5]
    return new_time
  if new_tmsecs<0:
    return '00:00:00,000'
def subs_ext(subfile):
  sub=open(subfile,'r').read()
  nifts_set=re.findall(r'(\d+)\n(\S+) --> (\S+)\n([\S\s]+?)\n\n',sub)
  print('Subtitle Extracted')
  return nifts_set
def nifts_tup_modif(tuple,error,type):
  new_itime=time_subtr(tuple[1],error,type)
  new_ftime=time_subtr(tuple[2],error,type)
  modified_tuple=(tuple[0],new_itime,new_ftime,tuple[3])
  return modified_tuple
def num_test(num_string):
  test=False
  if num_string.isnumeric():
    if int(num_string) >= 0:
      test=True
  return test
def main():
  error_msg='Wrong usage! Usage: srt_filename error(in milliseconds) error-type(+ or -)(as in screw gauge)'
  if len(sys.argv)==4:
    args=sys.argv[1:]
    subfilename=args[0]
    if num_test(args[1]):
      error=int(args[1])
    if not num_test(args[1]):
      print('Error value invalid')
      print(error_msg)
      sys.exit(1)  
    if args[2]=='+' or '-':
      type=args[2]
    if not (args[2]=='+' or '-'):
      print('Error-Type invalid')
      print(error_msg)
      sys.exit(1)
    if subfilename[-3:]=='srt' and open(subfilename,'r'):
      nifts=subs_ext(subfilename)      
    if not (subfilename[-3:]=='srt' and open(subfilename,'r')):
      print('Subtitle file is not supported or does not exist!')
      print(error_msg)
      sys.exit(1)
    new_subfile=open('New '+subfilename,'w')
    new_nifts=[]
    for n in range(len(nifts)):
      print('Modifying Subtitle ',n+1)
      new_nifts=new_nifts+[nifts_tup_modif(nifts[n],error,type)]
      print('Modified Subtitle ',n+1)
    print(nifts[:3])
    print(nifts[-3:])
    print(new_nifts[:3])
    print(new_nifts[-3:])
    sub_text=''
    for tuple in new_nifts:
      sub_text=sub_text+tuple[0]+'\n'+tuple[1]+' --> '+tuple[2]+'\n'+tuple[3]+'\n\n'
    new_subfile.write(sub_text)
    new_subfile.close()
    sys.exit(1)
  else:
    print(error_msg)
    sys.exit(1)
if __name__ == '__main__':
  main()

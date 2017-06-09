import random
set=[1,2,3,4,5,6,7,8,9]
for n in range(15):
   pin_set=[]
   pin=''
   while len(pin)!= 8:
      new_num=random.choice(set)
      if not pin_set.__contains__(new_num):
        pin_set.append(new_num)
        pin=pin+str(new_num)
   print(pin)

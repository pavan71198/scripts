import sys
if sys.version[0]=='2':
  input=raw_input
def prime_test(n):
  prime=True
  if n > 1:
    for div in range(int(n**(1/2))+1)[2:]:
        if (n % div)==0:
          prime = False
          break
  elif n == 1:
    prime = False
  return prime
def primes_list(range_num):
  primes=[]
  num=2
  while num <= range_num :
    if primes:
      prime=True
      for p in primes:
        if num%p==0:
          prime=False
          break
      if prime:
        primes.append(num)
    else:
      primes.append(num)
    num=num+1
  return primes
def prime_test_output(n) :
  if prime_test(n):
    print(n ,'is a prime number.')
  else :
    print(n ,'is not a prime number.')
def primes_list_output(range_num_string):
  range_num = float(range_num_string)
  primes_list0 = primes_list(range_num)
  if len(primes_list0)==0:
    print('There are no primes less than or equal to',range_num_string)
  elif len(primes_list0)==1:
    print(str(primes_list0[0]),'is the only prime less than or equal to',range_num_string)
  else:
    primes_text=''
    for n in range(len(primes_list0)):
      if n!=(len(primes_list0)-1):
        primes_text=primes_text + str(primes_list0[n]) + ' , '
      else:
        primes_text = primes_text[:-3] + ' and ' + str(primes_list0[n]) + ' are the only primes less than or equal to ' + range_num_string
    print(primes_text)
    print('i.e. there are ',len(primes_list0),' primes below ',range_num_string)
def primes_list_file(range_num_string):
  file=open('Primes up to '+range_num_string+'.txt','w')
  range_num = float(range_num_string)
  primes_list0 = primes_list(range_num)
  if len(primes_list0)==0:
    file.write('There are no primes less than or equal to '+range_num_string)
  elif len(primes_list0)==1:
    file.write(str(primes_list0[0])+' is the only prime less than or equal to '+range_num_string)
  else:
    primes_text=''
    for n in range(len(primes_list0)):
      if n!=(len(primes_list0)-1):
        primes_text=primes_text + str(primes_list0[n]) + ' , '
      else:
        primes_text = primes_text[:-3] + ' and ' + str(primes_list0[n]) + ' are the only primes less than or equal to ' + range_num_string
    file.write(primes_text+'\n'+'i.e. there are '+str(len(primes_list0))+' primes below '+range_num_string)
def num_test(num_string):
  test=False
  if num_string.isnumeric():
    if int(num_string) > 0:
      test=True
  return test
def main():
  while True:
    print('1 - To find whether a given natural number is prime or not.','2 - To find all the prime numbers less than or equal to a given number.','3 - To write all the primes up to a number to a txt file named (Primes up to [number].txt) in the working directory.','exit - To close the program.',sep = '\n\n')
    print('\n')
    input_1 = input('Enter your choice here : ')
    if input_1 == '1':
      print('\n')
      print('Note: Only numbers without decimal points are taken as primes i.e 5 is taken as prime but not 5.0,5.00,etc.')
      print('\n')
      print('Give a natural number that you want to check is prime or not.')
      print('\n')
      input_2 = input('Enter the number here : ')
      if num_test(input_2):
        print('\n')
        prime_test_output(int(input_2))
        print('\n')
      elif not num_test(input_2):
        if float(input_2):
          print('\n')
          print(input_2,' is either not a prime number or not in the natural number form i.e. without decimal points.')
          print('\n')
      else:
        print('\n')
        print('Enter a real number.')
        print('\n')
    elif input_1=='2':
      print('\n')
      print('Give a number to find all the prime numbers less than that number.')
      print('\n')
      input_2=input('Enter the number here : ')
      if float(input_2):
        print('\n')
        primes_list_output(input_2)
        print('\n')
      else:
        print('\n')
        print('Enter a real number.')
        print('\n')
    elif input_1=='3':
      print('\n')
      print('Give a number to find all the prime numbers less than that number and write them to a file.')
      print('The file is saved in the working directory with name (Primes up to [number].txt)')
      print('\n')
      input_2=input('Enter the number here : ')
      if float(input_2):
        print('\n')
        primes_list_file(input_2)
        print('\n')
      else:
        print('\n')
        print('Enter a real number.')
        print('\n')
    elif input_1=='exit':
      print('\n')
      print('Bye Bye..!')
      print('\n')
      sys.exit()
    else:
      print('\n')
      print('Enter a valid choice.')
      print('\n')
if __name__=='__main__':
  main()


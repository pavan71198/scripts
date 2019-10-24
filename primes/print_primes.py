def main():
  primes=[]
  num=2
  while True:
    if primes:
      prime=True
      for p in primes:
        if num%p==0:
          prime=False
          break
      if prime:
        primes.append(num)
        print(num)
    else:
      primes.append(num)
      print(num)
    num=num+1
if __name__=='__main__':
  main()

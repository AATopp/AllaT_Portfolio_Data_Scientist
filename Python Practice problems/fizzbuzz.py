# write a program that prints the numbers ranging from one to 50. But for multiples of three, print "Fizz" instead of the number, and for the multiples of five, print "Buzz." 
# For numbers which are multiples of both three and five, print "FizzBuzz"

for fizzbuzz in range(1,51):
    if fizzbuzz % 3 == 0 and fizzbuzz % 5 == 0:
        print("FizzBuzz")
        continue
    elif fizzbuzz % 3 == 0:
        print("Fizz")
        continue
    elif fizzbuzz % 5 == 0:
        print("Buzz")
        continue
    
    print(fizzbuzz)
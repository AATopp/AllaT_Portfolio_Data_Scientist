# Lucky 7
# for loop
# Read an integer number n. This is a number of integer values you will receive on the next n lines.
# Among these numbers find the multiples of 7 (that is, numbers that could be divided by 7 without the remainder)
# and print their squares. Each square number should be printed on a new line.

num = int(input())

for _n in range(num):
    x = int(input())
    if x % 7 == 0:
        print(x ** 2)
     
     


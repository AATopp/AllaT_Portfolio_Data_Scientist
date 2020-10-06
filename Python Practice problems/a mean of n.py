# For loop -> A mean of n
# Write a program that calculates the arithmetic mean. The arithmetic mean is a sum of all numbers divided by their total count.

n = int(input())
sum_i = 0
for i in range(n):
    x = int(input())
    sum_i += x
print(sum_i/n)

# The average of all numbers

a = int(input())
b = int(input())

sum_ab = 0
ab = 0

for i in range(a, b + 1):
    if i % 3 == 0:
        sum_ab = sum_ab + i
        ab = ab + 1
        
print(sum_ab / ab)

# Accept number from user and calculate the sum of all number between 1 and given number
# For example user given 10 so the output should be 55

summa = 0
n = int(input())
for i in range(1, n + 1):
    summa += i    
print(summa)
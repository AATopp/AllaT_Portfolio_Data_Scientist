
# A prime number is a number great than 1 and divisible only by 1 and itself.
# Determine whether the input number is a prime number.

prime = int(input())
answer = 'This number is prime'

if prime <= 1:
    answer = "This number is not prime"
    
for i in range(2, prime):
    if prime % i == 0:
        answer = 'This number is not prime'
        break
        
print(answer)

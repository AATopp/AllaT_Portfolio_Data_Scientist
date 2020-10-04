# A. Topp
# Reverse a numeric sentence 
# Read it from the input and print its numbers in reverse order separated by spaces.

flip = input().split() #1 22 3
reverse = flip[::-1]
print(' '.join(reverse))
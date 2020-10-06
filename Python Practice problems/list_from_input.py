# A Topp
# List from input (for loop)
# Write a program that takes n numbers as input, creates a list from them, and then prints it.
# The first input line is n – length of the resulting list. It is followed by n lines containing list elements.

n = int(input())
lst = []

for _i in range(n):
    x = int(input())
    lst.append(x)
print(lst)
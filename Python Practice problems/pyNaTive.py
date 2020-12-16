# Given an input string with the combination of the lower 
# and upper case arrange characters in such a way that all
# lowercase letters should come first.

str1 = 'PyNaTive'
# outcome: yaivePNT
lower = []
upper = []

for i in str1:
    if i.islower():
        lower.append(i)
    else:
        upper.append(i)

sorted = ''.join(lower + upper)

print(sorted)
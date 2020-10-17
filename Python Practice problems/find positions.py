nums = ['5', '8', '2', '7', '8', '8', '2', '4']
x = input()
lst = []

count = 0

for i in nums:
    if i == x:
        lst.append(str(count))
    count += 1
        
if len(lst) != 0:
    print(" ".join(lst))
elif len(lst) == 0:
    print("not found")
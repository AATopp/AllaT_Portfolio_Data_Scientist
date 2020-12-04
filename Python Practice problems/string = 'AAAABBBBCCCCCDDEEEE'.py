string = 'AAAABBBBCCCCCDDEEEEF'

res = ''
count = 1

res += string[0]

for i in range(len(string)-1):
    if (string[i] == string[i+1]):
        count += 1
    else:
        if (count > 1):
            res +=str(count)
        res += string[i]
        count = 1

if (count > 1):
    res += str(count)

print(res)

#https://stackoverflow.com/questions/32855812/create-a-compress-function-in-python
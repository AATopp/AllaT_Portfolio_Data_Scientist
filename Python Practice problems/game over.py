# A Topp
# 


games = input()

correct = 0
incorrect = 0

for n in games:
    if n == 'C':
        correct += 1
    elif n == 'I':
        incorrect += 1
        if incorrect == 3:
            print("Game over\n" + str(correct))
            break
else:
    print("You won\n" + str(correct))


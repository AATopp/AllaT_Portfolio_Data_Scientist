# Loop control stateent. The mean 
# Calculate the arithmetic mean of integer numbers. You will receive the integers on separate lines. 
# The numeric sequence ends with a period ., so stop reading the input on it.

numbers = list()
while True:
    number_text = input()
    if number_text == ".":
        break
    else:
        numbers.append(int(number_text))
count = 0
for n in numbers:
    count = count + n
mean = count / len(numbers)
print(mean)
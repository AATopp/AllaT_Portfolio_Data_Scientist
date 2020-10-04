# A. Topp
# Count up the squares
# Write a program that reads from the console integers (one in a line) until their sum is equal to 0. 
# Immediately after that, it should display the sum of the squares of all the entered numbers.
# It is guaranteed that at some point the sum of the entered numbers will be equal to 0. 
# After that, you should stop reading the input.
# You only need to output the sum of the squares once. 
# Don't output it every time after reading an integer from the input.
# In case the first integer equals to 0, just print out 0 instead of the sum of the squares.

sum_ = 0
num_list = []
sum_of_squares = 0

while True:
    number = int(input())
    sum_ += number
    num_list.append(number)
    if sum_ == 0:
        for i in num_list:
            sum_of_squares += i * i
        print(sum_of_squares)
        break

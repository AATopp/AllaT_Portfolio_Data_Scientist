# Write a program that asks the user for five numbers and then prints out the average of those numbers. 
# When you run your program, it should match the following format:

string = "eshChlen"

for letter in string:
    if letter.isupper():
        string=string.replace(letter, "_" + letter.lower())
        
string = string.lower()

print(string)

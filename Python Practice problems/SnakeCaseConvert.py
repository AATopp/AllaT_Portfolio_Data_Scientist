# A. Topp
# Converting the string from SnakeCase to snake_Case

string = "hiHiWhereWhy"

for letter in string:
    if letter.isupper():
        string=string.replace(letter, "_" + letter.lower())
        
string = string.lower()

print(string)

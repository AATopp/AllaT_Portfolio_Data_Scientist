# A Topp
# Loop control statements -> Party time
# James is hosting a party today. He decided to welcome all new guests personally.
# To remember their names, James kindly asks you to write them in a list. Read the names from the input, 
# each on a new line, and stop at a single period . that denotes the end of the sequence.
# Print your list and its length (the number of guests) for James.

name_list = []

while True:
    names = input()
    if names == ".":
        break
    else:
        name_list.append(names)
    
print(name_list)
print(len(name_list))
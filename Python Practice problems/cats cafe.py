# A Topp
# Cat cafes, loop control statements
# Each string contains a café's name followed by a space and the number of cats in it, e.g. Paws 11, Kittens 9.
# The names would be one-word only. Read input lines until you get a string MEOW (without any number).

cafe_list = []
f_list = []


while True:
    cafes = input()
    if cafes == "MEOW":
        break
    store = cafes.split()[0]
    cafe_list.append(store)
    cat_number = cafes.split()[1]
    cat_number = int(cat_number)
    f_list.append(cat_number)
    
        
        
max_cats_index = f_list.index(max(f_list))
print(cafe_list[max_cats_index])
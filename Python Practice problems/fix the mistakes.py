# Alla Topp
# The code below is supposed to find all website addresses (https://, http://, www.) in the input text. 
# However, it is not finished and there are several mistakes in the code. Find the mistakes, 
# fix them and print all the addresses in the order in which they appear in the text, each on a new line.

text = 'WWW.GOOGLE.COM uses 100-percent renewable energy sources and www.ecosia.com plants a tree for every 45 searches!'
words = text.split()

for word in words:
    # finish the code here
    if word[0:4] == 'www.' or word[0:4] == 'WWW.' or word[0:7] == 'http://' or word[0:8] == 'https://':
        print(word)
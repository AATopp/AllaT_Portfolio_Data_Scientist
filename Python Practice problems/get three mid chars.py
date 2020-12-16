# Exercise Question 1: Given a string of odd length greater 7, 
# return a string made of the middle three chars of a given String

def getmidthreechars(str1):

    midindex = int(len(str1)/2)
    print('Original string is', str1)
    midstr = str1[midindex-1:midindex+2]
    print('Chars in the middle are', midstr)

getmidthreechars("JhonDipPeta")
getmidthreechars('JaSonAy')


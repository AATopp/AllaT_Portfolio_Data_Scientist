# Given 2 strings, s1 and s2, 
# create a new string by appending s2 in the middle of s1

def apinmiddle(s1, s2):

    midind = int(len(s1)/2)
    print(s1,s2)

    apmiddle = s1[:midind] + s2 + s1[midind:]
    print(apmiddle)
    print(s1[:midind])

apinmiddle("Ault", "Kelly")
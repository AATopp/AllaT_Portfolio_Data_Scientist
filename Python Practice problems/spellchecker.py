# A.Topp
# Spellchecker
# Write a spellchecker that tells you which words in the sentence are spelled incorrectly. 

dictionary = ['all', 'an', 'and', 'as', 'closely', 'correct', 'equivocal',
              'examine', 'indication', 'is', 'means', 'minutely', 'or', 'scrutinize',
              'sign', 'the', 'to', 'uncertain']
words = "srutinize is to examene closely and minutely".split() #srutinize is to examene closely and minutely : input()

incorrect = False
for i in words:
    if i not in dictionary:
        print(i)
        incorrect = True

if not incorrect:
    print("OK")
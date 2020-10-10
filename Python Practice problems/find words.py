# Find all words that end in "s" and print them together separated by an underscore.
# After such words there will be no punctuation marks, you do not need to worry about that.
# Input: First ladies rule the State and state the rule: ladies first
# Output: ladies_ladies

lds = "First ladies rule the State and state the rule: ladies first"
lds = lds.split() # [First, ladies, rule, ...]

strng = ''
lst = []

for word in lds:

    if word[-1] == "s":
        lst.append(word)

print("_".join(lst))
# Convert text from the phrase with underscores to lower letter
# A. Topp

s = "hello_string_processing_InPython"

new_string = ""

capitalize_next = True
for character in s:
    if capitalize_next:
        new_string += character.upper()
        capitalize_next = False
    elif character == '_':
        capitalize_next = True
    else:
        new_string += character

print(new_string)

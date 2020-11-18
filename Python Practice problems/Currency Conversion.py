# Currency Conversion
# Convert Euros to US dollars

euros = float(input("How many euros are you exchanging? "))
rate = float(input("What is the exchange rate? "))

amnt = round(euros * rate / 84, 1)

print(str(euros) + " euros at an exchange rate of " + str(rate) + " is " + str(amnt) + " U.S. dollars.")

# Self-checkout 
# Create a self-checkout system.Prompt for the prices and quantities of three items. 
# Calvulate the subtotal of the items. Then calculate the tax using a tax rate as 5.5%. 

try:

    price1 = int(input("Enter the price of item 1: "))
    num1 = int(input("Enter the quantity of the item 1: "))

    price2 = int(input("Enter the price of item 2: "))
    num2 = int(input("Enter the quantity of the item 2: "))

    price3 = int(input("Enter the price of item 3: "))
    num3 = int(input("Enter the quantity of the item 3: "))

    sub = (price1*num1) + (price2*num2) + (price3*num3)
    tax = .055 * sub  
    tot = sub + tax

    print("Subtotal: $",sub)
    print("Tax: $",tax)
    print("Total: $",tot)

except ValueError:
    print("Not a numeric value was entered")
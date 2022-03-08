cont = 0
for var in range(1,11):
    num = int(input("Dime el {} número: \n".format(var)))
    if num % 2 == 0:
        cont = cont + 1
print("Has introducido {} números pares.".format(cont))
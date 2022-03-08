isPar = False;
for var in range(1, 10):
    num = int(input("Introduce el {} número: \n".format(var)))
    if num % 2 == 0:
        isPar = True;
if isPar:
    print("Has introducido un número par.")
else: 
    print("Has introducido un número impar.")
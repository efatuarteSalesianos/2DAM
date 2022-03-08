suma = 0
for var in range(1, 11):
    num = int(input("Introduzca el {} sumando: \n".format(var)))
    if num % 2 == 0:
        suma = suma + num
print("La suma de todos los números pares introducidos es ", suma)
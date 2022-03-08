es_primo = True
num = int(input("Introduce un número: \n"))
for var in range(2, num-1):
    if num % var == 0:
        es_primo = False
        break
if es_primo:
    print("El número introducido es primo")
else: print("El número {} no es primo".format(num))
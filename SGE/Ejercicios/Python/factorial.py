resultado = 1
num = int(input("Introduzca un número: \n"))

contador = 2

while contador <= num:
    resultado = resultado * contador
    contador = contador + 1
print("El factorial de {} es".format(num), resultado)
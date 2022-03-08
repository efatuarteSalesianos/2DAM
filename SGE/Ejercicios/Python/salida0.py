num = int(input("Introduzca un número: \n"))
suma = 0
cont = 0
while num != 0:
    suma = suma + num
    cont = cont + 1
    print("Si desea salir del programa introduzca un 0.")
    num = int(input("Introduzca un número: \n"))
if cont == 0: 
    media = 0
    print("Has salido del programa!")
media = suma / cont
print("La media de los números introducidos es", media)
print("Has salido del programa!")

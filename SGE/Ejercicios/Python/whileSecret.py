secreto = "password"
clave = input("Introduce la contraseña: \n")
while clave != secreto:
    print("CLAVE INCORRECTA!!!")
    clave = input("Introduzca de nuevo la contraseña: \n")
print("Bienvenido al programa!")
print("Gracias por usar nuestros servicios")
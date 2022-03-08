secreto  = "miPass"

while True:
    clave = input("Introduzca una contraseña: \n")
    if clave != secreto:
        print("Credenciales incorrectas")
    if clave == secreto:
        break;
print("Bienvenido al programa!!")
print("Gracias por usar nuestros servicios")
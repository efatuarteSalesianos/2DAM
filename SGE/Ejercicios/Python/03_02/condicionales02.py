pass01 = input("Introduzca su contraseña:\n")
pass02 = input("Confirme su contraseña:\n")

if pass01.lower() == pass02.lower():
    print("Las contraseñas coinciden")
else:
    print("Las contraseñas no coinciden")
edad = int(input("Introduzca su edad:\n"))
ingresos = int(input("Introduzca sus ingresos mensuales:\n"))

if edad < 16 & ingresos < 1000:
    print("Usted no tiene que tributar")
else:
    print("Usted tiene que tributar")
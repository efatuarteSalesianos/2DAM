dia = int(input("Introduce un día (formato numérico): \n"))
mes = int(input("Introduce un mes (formato numérico): \n"))
anyo = int(input("Introduce un año: \n"))

if mes == 1 or mes == 3 or mes == 5 or mes == 7 or mes == 8 or mes == 10 or mes == 12:
    dia_mes = 31;
elif mes == 4 or mes == 6 or mes == 8 or mes == 9 or mes == 11:
    dia_mes = 30;
elif mes == 2:
    if (anyo % 4 == 0 and not (anyo % 100 == 0) or anyo % 400 == 0):
        dia_mes = 29;
    else: 
        dia_mes = 28;
else:
    print("Fecha no existente")

if dia < 0 or dia > dia_mes:
    print("Fecha no existente")
else:
    print("La fecha introducida ha sido: ",dia,"/",mes,"/",anyo)
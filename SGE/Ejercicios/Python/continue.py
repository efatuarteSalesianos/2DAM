cont = 0
max = int(input("Introduzca el máximo al que quieres llegar: \n"))
while cont<max:
    cont = cont + 1
    if cont % 2 == 1:
        continue
    print(cont)
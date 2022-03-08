from math import pi


def area_circulo(radio):
    return pi * pow(radio,2)


print('El área del círculo es: ' + str(area_circulo(5).__round__(2)))

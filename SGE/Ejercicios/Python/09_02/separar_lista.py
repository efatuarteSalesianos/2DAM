numeros = [-12, 84, 13, 20, -33, 101, 9]


def separar(*args):
    pares = []
    impares = []
    for arg in args:
        if arg % 2 == 0:
            pares.append(arg)
        else:
            impares.append(arg)

    return pares, impares


pares, impares = separar(*numeros)
print('Pares: ' + str(pares))
print('Impares: ' + str(impares))

def recortar_numero(num, min, max):
    if num < min:
        return min
    if num > max:
        return max
    else:
        return num


print(recortar_numero(15, 0, 10))

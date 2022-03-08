import csv

ciudades = []
with open("climatologia.csv", newline="\n",encoding="utf8") as fichero:
    lector = csv.reader(fichero)
    for fecha, estacion, provincia, temperatura_maxima, hora_temperatura_maxima, temperatura_minima, hora_temperatura_minima, temperatura_media, racha_viento, hora_racha_viento, velocidad_maxima_viento, hora_velocidad_maxima_viento, precipitacion_total, precipitacion_0_a_6, precipitacion_6_a_12, precipitacion_12_a_18, precipitacion_18_a_24 in lector:
        ciudades.append({"fecha": fecha, "estacion": estacion, "provincia": provincia, "temperatura_maxima": temperatura_maxima, "hora_temperatura_maxima": hora_temperatura_maxima, "temperatura_minima": temperatura_minima, "hora_temperatura_minima": hora_temperatura_minima, "temperatura_media": temperatura_media, "racha_viento": racha_viento, "hora_racha_viento": hora_racha_viento, "velocidad_maxima_viento": velocidad_maxima_viento, "hora_velocidad_maxima_viento": hora_velocidad_maxima_viento, "precipitacion_total": precipitacion_total, "precipitacion_0_a_6": precipitacion_0_a_6, "precipitacion_6_a_12": precipitacion_6_a_12, "precipitacion_12_a_18": precipitacion_12_a_18, "precipitacion_18_a_24": precipitacion_18_a_24})

ciudad = input("Introduce una ciudad: \n")

def getTemperatura(ciudad):
    for c in ciudades:
        if c["estacion"] == ciudad.capitalize():
            return c["temperatura_maxima"]
    return "No existe la ciudad que buscas"

print(getTemperatura(ciudad))
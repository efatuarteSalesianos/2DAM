FROM node
LABEL maintainer="luismi.lopez@salesianos.edu"
ARG PORT=3000
ENV APP_PORT=${PORT}
RUN npm update npm -g
# Establecemos el directorio de trabajo
WORKDIR /opt/app
# Copiamos el código fuente
# Se trata de uno de nuestros proyectos de ejempo
# Copiamos primero el fichero de manifiesto para instalar las librerías
COPY package*.json ./
# Instalamos todos los módulos y dependencias
RUN npm install
# Copiamos el resto del código
COPY . .
# Exponemos el puerto PORT
EXPOSE ${APP_PORT}
# Ejecutamos la aplicación
CMD [ "npm", "start" ]
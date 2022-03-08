FROM maven:3.8.3-openjdk-17 as build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN mvn install -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM openjdk:17-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target/dependency

#Establecemos cuál es la url
ARG H2_URL = jdbc:h2:./db/basededatos
ENV spring.datasource.url = ${H2_URL}

#Establecemos cuál es el usuario
ARG H2_USERNAME = sa
ENV spring.datasource.username = ${H2_USERNAME}

#Establecemos cuál es la contraseña por defecto
ARG H2_PASSWORD = 
ENV spring.datasource.password = ${H2_PASSWORD}

COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.salesianostriana.dam.ApiRestMonumentosApplication"]
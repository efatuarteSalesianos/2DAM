package com.salesianos.dam.pruebasService;

import com.salesianos.dam.pruebasService.model.Alumno;
import com.salesianos.dam.pruebasService.services.AlumnoServicio;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
@RequiredArgsConstructor
public class MainDePrueba {
    private final AlumnoServicio service;

    @PostConstruct
    public void test() {

        Alumno alumno = Alumno.builder()
                .nombre("Ernesto")
                .apellido("Fatuarte")
                .edad(26)
                .build();

        service.save(alumno);

        service
                .findAll()
                .forEach( a -> System.out.printf("%s %s\n", a.getNombre(), a.getApellido()));


    }
}

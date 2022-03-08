package com.salesianostriana.dam.oneToManyBidi;

import com.salesianostriana.dam.oneToManyBidi.modelos.Alumno;
import com.salesianostriana.dam.oneToManyBidi.modelos.Curso;
import com.salesianostriana.dam.oneToManyBidi.repositorios.AlumnoRepositorio;
import com.salesianostriana.dam.oneToManyBidi.repositorios.CursoRepositorio;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;

@Component
@RequiredArgsConstructor
public class MainDePrueba {

    private final AlumnoRepositorio alumnoRepo;
    private final CursoRepositorio cursoRepo;

    @PostConstruct
    public void initData() {
        Curso c1 = Curso.builder()
                .nombre("2 DAM")
                .tutor("Luismi")
                .alumnos(new ArrayList<>())
                .build();

        Alumno a1 = Alumno.builder()
                .nombre("Ernesto")
                .apellidos("Fatuarte Fernández")
                .email("fatuarte.feern21@triana.salesianos.edu")
                .build();

        cursoRepo.save(c1);
        alumnoRepo.save(a1);
        a1.addCurso(c1);

        System.out.printf("%s, %s, %s\n", a1.getNombre(), a1.getApellidos(), a1.getCurso() != null ? a1.getCurso().getNombre() : "Sin curso");
        System.out.println("Nº de alumnos en el curso: " + c1.getAlumnos().size());
        System.out.println(c1);


    }
}

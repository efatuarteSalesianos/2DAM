package com.salesianostriana.dam.manyToMany;

import com.salesianostriana.dam.manyToMany.model.Alumno;
import com.salesianostriana.dam.manyToMany.model.Asignatura;
import com.salesianostriana.dam.manyToMany.services.AlumnoService;
import com.salesianostriana.dam.manyToMany.services.AsignaturaService;
import com.salesianostriana.dam.manyToMany.services.CursoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class MainDePrueba {

    private final AlumnoService alumnoService;
    private final AsignaturaService asignaturaService;
    private final CursoService cursoService;

    @PostConstruct
    public void initData() {

        Alumno a1 = Alumno.builder()
                .nombre("Ernesto")
                .apellidos("Fatuarte Fernández")
                .email("fatuarte.feern21@triana.salesianos.edu")
                .asignaturas(new ArrayList<>())
                .build();

        List<Asignatura> asignaturas = List.of(
                Asignatura.builder()
                        .nombre("PSP")
                        .profesor("Luismi López")
                        .build(),
                Asignatura.builder()
                        .nombre("DI")
                        .profesor("Miguel Campos")
                        .build(),
                Asignatura.builder()
                        .nombre("FOP")
                        .profesor("Fernando Fanegas")
                        .build()
        );

        alumnoService.save(a1);
        asignaturaService.saveAll(asignaturas);

        a1.getAsignaturas().addAll(asignaturas);
        //asignaturas.forEach(asignatura -> a1.addAsignatura(asignatura));
        asignaturas.forEach(a1::addAsignatura);
        alumnoService.edit(a1);

        System.out.println("Alumno: " + a1.getNombre() + " " + a1.getApellidos());
        System.out.println("\tAsignaturas:");
        a1.getAsignaturas().forEach(a -> System.out.println("\t\t" + a.getNombre() + ", Profesor: " + a.getProfesor()));

        Alumno al = alumnoService.findById(0L).orElse(null);
        al.getAsignaturas().forEach(a -> System.out.println("\t\t" + a.getNombre() + ", Profesor: " + a.getProfesor()));

    }
}

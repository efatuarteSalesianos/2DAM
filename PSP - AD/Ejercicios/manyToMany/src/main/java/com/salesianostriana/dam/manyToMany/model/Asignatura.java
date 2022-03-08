package com.salesianostriana.dam.manyToMany.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Builder
@Getter @Setter @ToString
public class Asignatura implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    private String nombre;
    private String profesor;

    @ManyToOne
    private Curso curso;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @ManyToMany(mappedBy="asignaturas", fetch = FetchType.EAGER)
    private List<Alumno> alumnos = new ArrayList<>();

    public Asignatura(String nombre, String profesor) {
        this.nombre = nombre;
        this.profesor = profesor;
    }

    public Asignatura(String nombre, String profesor, Curso curso) {
        this.nombre = nombre;
        this.profesor = profesor;
        this.curso = curso;
    }
}

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
public class Alumno implements Serializable {

    @Id
    @GeneratedValue
    private long id;

    private String nombre, apellidos, email;

    @ManyToOne
    private Curso curso;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            joinColumns = @JoinColumn(name="alumno_id"),
            inverseJoinColumns = @JoinColumn(name="asignatura_id")
    )
    private List<Asignatura> asignaturas = new ArrayList<>();


    public Alumno(String n, String a, String e) {
        this.nombre = n;
        this.apellidos = a;
        this.email = e;
    }

    /** MÉTODOS HELPERS PARA ASOCIACIÓN CON CURSO **/
    public void addCurso(Curso c) {
        this.curso = c;
        if(c.getAlumnos() == null)
            c.setAlumnos(new ArrayList<>());
        c.getAlumnos().add(this);
    }

    public void removeCurso(Curso c) {
        c.getAlumnos().remove(this);
        this.curso = null;
    }

    /** MÉTODOS HELPERS PARA ASOCIACIÓN CON ASIGNATURA **/
    public void addAsignatura(Asignatura a) {
        asignaturas.add(a);
        if(this.getAsignaturas() == null)
            this.setAsignaturas((new ArrayList<>()));
        if(a.getAlumnos() == null)
            a.setAlumnos(new ArrayList<>());
        a.getAlumnos().add(this);
    }

    public void removeAsignatura(Asignatura a) {
        asignaturas.remove(a);
        a.getAlumnos().remove(this);
    }
}

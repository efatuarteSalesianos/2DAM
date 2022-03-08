package com.salesianostriana.dam.oneToManyBidi.modelos;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Builder @Getter @Setter
public class Alumno {

    @Id
    @GeneratedValue
    private long id;

    private String nombre, apellidos, email;

    @ManyToOne
    private Curso curso;

    public Alumno(String n, String a, String e) {
        this.nombre = n;
        this.apellidos = a;
        this.email = e;
    }

    public Alumno(String nombre, String apellidos, String email, Curso curso) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.curso = curso;
    }

    /********************************************/
    /* MÉTODOS HELPERS					        */
    /********************************************/

    public void addCurso(Curso c) {
        this.curso = c;
        c.getAlumnos().add(this);
    }

    public void removeCurso(Curso c) {
        c.getAlumnos().remove(this);
        this.curso = null;
    }
}

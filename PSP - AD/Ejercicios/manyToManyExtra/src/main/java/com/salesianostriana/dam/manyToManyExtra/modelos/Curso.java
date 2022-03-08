package com.salesianostriana.dam.manyToManyExtra.modelos;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter @ToString
@Builder
public class Curso implements Serializable {

    @Id @GeneratedValue
    private long id;

    private String nombre, tutor;

    /** ASOCIACIÓN ONE TO MANY CON ALUMNO **/
    @OneToMany(mappedBy="curso", fetch = FetchType.EAGER)
    private List<Alumno> alumnos = new ArrayList<>();

    /********************************************/
    /* MÉTODOS AUXILIARES CON ALUMNO    	    */
    /********************************************/

    public void addAlumno(Alumno a) {
        this.alumnos.add(a);
        a.setCurso(this);
    }

    public void removeAlumno(Alumno a) {
        this.alumnos.remove(a);
        a.setCurso(null);
    }

    /** ASOCIACIÓN ONE TO MANY CON ASIGNATURAS **/
    @OneToMany(mappedBy="curso", fetch = FetchType.EAGER)
    private List<Asignatura> asignaturas = new ArrayList<>();

    /********************************************/
    /* MÉTODOS AUXILIARES CON ASIGNATURA	    */
    /********************************************/

    public void addAsignatura(Asignatura a) {
        this.asignaturas.add(a);
        a.setCurso(this);
    }

    public void removeAsignatura(Asignatura a) {
        this.asignaturas.remove(a);
        a.setCurso(null);
    }
}

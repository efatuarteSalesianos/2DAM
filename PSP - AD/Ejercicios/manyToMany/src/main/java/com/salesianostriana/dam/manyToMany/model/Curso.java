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
public class Curso implements Serializable {

    @Id
    @GeneratedValue
    private long id;

    private String nombre;
    private String tutor;


    public Curso(String nombre, String tutor) {
        this.nombre = nombre;
        this.tutor = tutor;
    }

    /** ASOCIACIÓN ONE TO MANY CON ALUMNO **/

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @OneToMany(mappedBy="curso", fetch = FetchType.EAGER)
    private List<Alumno> alumnos = new ArrayList<>();


    /********************************************/
    /* MÉTODOS AUXILIARES o HELPERS			    */
    /********************************************/

    /**
     * Método auxiliar para el tratamiento bidireccional de la asociación. Añade a un alumno
     * a la colección de alumnos de un curso, y asigna a dicho alumno este curso como el suyo.
     * @param a
     */
    public void addAlumno(Alumno a) {
        this.alumnos.add(a);
        a.setCurso(this);
    }

    /**
     * Método auxiliar para el tratamiento bidireccional de la asociación. Elimina un alumno
     * de la colección de alumnos de un curdso, y desasigna a dicho alumno el curso, dejándolo como nulo.
     * @param a
     */
    public void removeAlumno(Alumno a) {
        this.alumnos.remove(a);
        a.setCurso(null);
    }


    /** ASOCIACIÓN ONE TO MANY CON ASIGNATURAS **/
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @OneToMany(mappedBy="curso", fetch = FetchType.EAGER)
    private List<Asignatura> asignaturas = new ArrayList<>();


    // Métodos helper
    public void addAsignatura(Asignatura a) {
        this.asignaturas.add(a);
        a.setCurso(this);
    }

    public void removeAsignatura(Asignatura a) {
        this.asignaturas.remove(a);
        a.setCurso(null);
    }
}

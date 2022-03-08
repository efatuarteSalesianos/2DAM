package com.salesianostriana.dam.manyToManyExtra.modelos;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter @ToString
@Builder
public class MatriculaNotas implements Serializable {

    @EmbeddedId @Builder.Default
    private NotasPK id = new NotasPK();

    @ManyToOne
    @MapsId("alumno_id")
    @JoinColumn(name="alumno_id")
    private Alumno alumno;

    @ManyToOne
    @MapsId("asignatura_id")
    @JoinColumn(name="asignatura_id")
    private Asignatura asignatura;

    private int primeraEv;
    private int segundaEv;
    private int terceraEv;
    private int notaFinal;

    public MatriculaNotas(Alumno alumno, Asignatura asignatura, int primeraEv, int segundaEv, int terceraEv, int notaFinal) {
        this.alumno = alumno;
        this.asignatura = asignatura;
        this.primeraEv = primeraEv;
        this.segundaEv = segundaEv;
        this.terceraEv = terceraEv;
        this.notaFinal = notaFinal;
    }

    public MatriculaNotas(Alumno alumno, Asignatura asignatura) {
        this.alumno = alumno;
        this.asignatura = asignatura;
    }
}

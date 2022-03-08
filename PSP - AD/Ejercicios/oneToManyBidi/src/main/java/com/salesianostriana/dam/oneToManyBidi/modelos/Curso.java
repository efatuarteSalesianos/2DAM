package com.salesianostriana.dam.oneToManyBidi.modelos;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Builder @Getter @Setter @ToString
public class Curso {

    @Id @GeneratedValue
    private Long id;

    private String nombre, tutor;

    public Curso(String nombre, String tutor) {
        this.nombre = nombre;
        this.tutor = tutor;
    }

    // En mappedBy ponemos el atributo de la clase de enfrente que esté anotado con @ManyToOne
    @OneToMany(mappedBy = "curso")
    @ToString.Exclude
    private List<Alumno> alumnos;
}

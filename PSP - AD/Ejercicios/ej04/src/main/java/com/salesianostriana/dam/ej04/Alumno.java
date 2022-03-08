package com.salesianostriana.dam.ej04;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Alumno {

    @Id
    @GeneratedValue
    private Long id;

    private String nombre;
    private String apellido1;
    private String apellido2;
    private String telefono;
    private String email;

    @ManyToMany
    private Direccion direccion;

    @ManyToOne
    private Curso curso;
}

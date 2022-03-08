package com.salesianostriana.dam.ej04;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
@NoArgsConstructor
public class Curso {

    @Id
    @GeneratedValue
    private Long id;

    private String nombre;
    private String tipo;
    private String tutor;
    private Integer aula;
}

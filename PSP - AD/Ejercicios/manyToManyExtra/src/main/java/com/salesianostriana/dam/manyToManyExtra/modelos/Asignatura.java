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
public class Asignatura implements Serializable {

    @Id @GeneratedValue
    private Long id;

    private String nombre, profesor;

    @ManyToOne
    private Curso curso;

    @Builder.Default
    @OneToMany(mappedBy="asignatura", fetch = FetchType.EAGER)
    private List<MatriculaNotas> matriculaNotas = new ArrayList<>();
}

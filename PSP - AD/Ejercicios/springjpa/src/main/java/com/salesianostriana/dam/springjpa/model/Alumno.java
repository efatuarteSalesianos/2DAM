package com.salesianostriana.dam.springjpa.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@NoArgsConstructor
// @Getter @Setter @EqualsAndHashCode
@Data
@AllArgsConstructor @Builder
public class Alumno implements Serializable {

    @Id @GeneratedValue
    private Long id;

    private String nombre, apellido, email;

    public Alumno(String nombre, String apellido, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
    }
}

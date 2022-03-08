package com.salesianos.com.ejercicioHerencias.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
@SuperBuilder
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
// Establecemos Single Table como tipo de herencia
// ya que en las clases hijas únicamente vamos a añadir uno o dos nuevos atributos

// Ponemos la clase abstracta, ya que no vamos a crear instancias de cliente
// ya que con sus dos clases hijas contemplamos todos los distintos tipos de clientes
public abstract class Cliente implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre, email, direccion, telefono;

}

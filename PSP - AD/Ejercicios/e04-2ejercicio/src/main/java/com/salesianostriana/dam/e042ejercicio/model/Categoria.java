package com.salesianostriana.dam.e042ejercicio.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

/**
 * @Author Richard Cespedes
 */
@Entity
@Data
@NoArgsConstructor
public class Categoria {

    @Id
    @GeneratedValue
    private Long id;
    private String nombre;

    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @OneToMany(mappedBy="categoria", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Producto> productos;

    public Categoria(String nombre) {
        this.nombre = nombre;
    }
}

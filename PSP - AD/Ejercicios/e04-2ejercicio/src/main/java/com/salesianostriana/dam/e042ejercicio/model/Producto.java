package com.salesianostriana.dam.e042ejercicio.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import java.util.List;

/**
 * @Author Richard Cespedes
 */
@Entity
@Data
@NoArgsConstructor
public class Producto {

    @Id
    @GeneratedValue
    private Long id;
    private String nombre;
    private double desc;
    private double pvp;

    @ElementCollection
    private List<String> imagenes;

    @ManyToOne(fetch = FetchType.EAGER)
    private Categoria categoria;

    public Producto(String nombre, double desc, double pvp, List<String> imagenes, Categoria categoria) {
        this.nombre = nombre;
        this.desc = desc;
        this.pvp = pvp;
        this.imagenes = imagenes;
        this.categoria = categoria;
    }
}

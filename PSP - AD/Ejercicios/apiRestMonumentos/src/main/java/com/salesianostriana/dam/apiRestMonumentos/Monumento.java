package com.salesianostriana.dam.apiRestMonumentos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

// Añadimos anotaciones de Lombok para convertir a esta clase en nuestra entidad principal
// Data para autogenerar constructores, getter y setter y hash code
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Monumento {

    @Id
    @GeneratedValue
    private Long id;

    private String codigo_pais;
    private String nombre_pais;
    private String nombre_ciudad;
    private int[] localizacion = new int[2]; // Aqui sería recomendable que la localización hubiera sido un String
    private String nombre;
    @Lob // Usamos la anotación @lob para hacer que la cadena de caracteres acepte más longitud (Large Object)
    // @Column(length = 1000)
    private String descripcion;
    private String foto;

    public Monumento(String codigo_pais, String nombre_pais, String nombre_ciudad, int[] localizacion, String nombre, String descripcion, String foto) {
        this.codigo_pais = codigo_pais;
        this.nombre_pais = nombre_pais;
        this.nombre_ciudad = nombre_ciudad;
        this.localizacion = localizacion;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.foto = foto;
    }
}

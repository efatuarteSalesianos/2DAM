package com.salesianos.dam.pruebasService.model;

import lombok.*;

import javax.persistence.*;

@Entity // Notación obligatoria en las entidades
@Builder // Notación añadida para facilitar la creación de una instancia en el futuro main
@NoArgsConstructor // La clase entidad debe de tener un constructor sin argumentos
@AllArgsConstructor
@Getter @Setter
// No añadimos la notación @Data porque es más eficiente sobreescribir los método equals() y hashCode()
@Table(name = "Alumn") // Con la notación @Table podemos modificar el nombre de la tabla que se genera en bbdd
public class Alumno {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Ponemos una generación IDENTITY para que se vaya autoincrementando
    public Integer id;

    @Column(name = "name", nullable = false) // Con la notación @Column podemos modificar el nombre de una tabla en bbdd
    // Además, con nullable = false evitamos que este campo admita un valor false en bbdd
    public String nombre;

    @Column(name = "surname")
    public String apellido;

    @Column(name = "age")
    public Integer edad;
}

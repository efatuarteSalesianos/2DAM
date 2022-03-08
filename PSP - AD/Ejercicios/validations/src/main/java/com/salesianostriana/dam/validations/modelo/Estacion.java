package com.salesianostriana.dam.validations.modelo;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@Builder
public class Estacion implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    private String nombre;
    private String marca;
    private String ubicacion;
    private boolean tieneAutolavado;
    private BigDecimal precioGasoilNormal, precioGasolina95Octanos, precioGasoilEspecial, precioGasolina98;
    private String servicios;
    private LocalDateTime fechaApertura;
    private LocalDateTime fechaRegistro;

}

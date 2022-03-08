package com.salesianostriana.dam.validations.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.salesianostriana.dam.validations.validaciones.anotaciones.CompareDates;
import com.salesianostriana.dam.validations.validaciones.anotaciones.UniqueUbicacion;

import javax.persistence.Column;
import javax.persistence.Lob;
import javax.validation.constraints.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor @AllArgsConstructor
@Builder
@CompareDates.List({
        @CompareDates(
                fecha1 = "fechaApertura",
                fecha2 = "fechaRegistro",
                message = "La fecha de registro debe ser posterior a la fecha de apertura"
        )
})
public class EstacionDTO {

    @NotBlank(message = "{estacion.nombre.blank}")
    @Size(min = 2, max = 32, message = "{estacion.nombre.size}")
    private String nombre;

    @NotNull(message = "{estacion.marca.null}")
    private String marca;

    @NotBlank(message = "{estacion.ubicacion.blank}")
    @UniqueUbicacion(message = "{estacion.ubicacion.unique}")
    //@Pattern(regexp = "^([-+]?([1-8]?\\d(\\.\\d+)?|90(\\.0+)?),\\s*[-+]?(180(\\.0+)?|((1[0-7]\\d)|([1-9]?\\d))(\\.\\d+)?))(,\\s*[-+]?([1-8]?\\d(\\.\\d+)?|90(\\.0+)?),\\s*[-+]?(180(\\.0+)?|((1[0-7]\\d)|([1-9]?\\d))(\\.\\d+)?)){2,}$")
    private String ubicacion;

    @Column(name="tieneAutolavado", columnDefinition="boolean default false")
    private boolean tieneAutolavado;

    @NotNull(message = "{estacion.precioGasoil.null}")
    @PositiveOrZero(message = "{estacion.precioGasoil.positiveOrZero}")
    private BigDecimal precioGasoilNormal, precioGasolina95Octanos, precioGasoilEspecial, precioGasolina98;

    @Lob
    private String servicios;

    @Past(message = "{estacion.fechaApertura.past}")
    private LocalDateTime fechaApertura;

    private LocalDateTime fechaRegistro;
}

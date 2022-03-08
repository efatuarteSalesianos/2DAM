package com.salesianostriana.dam.e042ejercicio.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Ernesto Fatuarte
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GetProductoDTO {

    private String nombre;
    private double pvp;
    private String imagen;
    private String categoria;

}

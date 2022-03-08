package com.salesianostriana.dam.e042ejercicio.model;

import org.springframework.stereotype.Component;

/**
 * @Author Ernesto Fatuarte
 */
@Component
public class ProductoDTOConverter {

    public GetProductoDTO productoToGetProductoDTO (Producto p) {
        return GetProductoDTO.builder()
                .nombre(p.getNombre())
                .pvp(p.getPvp())
                .imagen(p.getImagenes().isEmpty() ? null : p.getImagenes().get(0))
                .categoria(p.getCategoria().getNombre())
                .build();
    }
}

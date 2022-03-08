package com.salesianostriana.dam.e042ejercicio.model;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.List;

/**
 * @Author Ernesto Fatuarte
 */
@Component
@RequiredArgsConstructor
public class InitData {

    private final ProductoRepository productoRepo;
    private final ProductoDTOConverter dtoConverter;

    @PostConstruct
    public void init() {

        productoRepo.saveAll(
                Arrays.asList(
                        new Producto("Tetrabrik de leche 500ml", 10, 2.5, List.of(new String[]{"imagen1", "imagen2"}), new Categoria("Lácteos")),
                        new Producto("Filete de pollo", 5, 1.30, List.of(new String[]{"imagen3", "imagen4"}), new Categoria("Cárnico"))
                )
        );
    }

}

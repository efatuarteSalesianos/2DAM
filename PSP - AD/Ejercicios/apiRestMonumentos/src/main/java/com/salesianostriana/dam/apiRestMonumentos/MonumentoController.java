package com.salesianostriana.dam.apiRestMonumentos;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

// Aqui usamos la anotación @RestController para que lo reconozca como un servicio APIRest
@RestController
@RequestMapping("/monumentos") // Ruta inicial de nuestro proyecto
@RequiredArgsConstructor
public class MonumentoController {

    private final MonumentoRepository repository;

    @Operation(summary = "Obtener una lista con todos los monumentos")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Se muestra la lista completa de monumentos",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Monumento.class)) })
    })
    @GetMapping("/")
    public List<Monumento> findAll() {
        return repository.findAll();
        // OTRA FORMA DE HACERLO!!
        // Podríamos devolver un objeto de tipo ResponseBody, que necesita un optional,
        // dentro del cual iría <List<Monumento>>
        //
        // public ResponseEntity<List<Monumento>> findAll() {
        //        return ResponseEntity
        //                .ok() Crea un objeto OkResultObject(200)
        //                .body(repository.findAll());
        // }
    }

    @Operation(summary = "Obtener la información de un monumento buscándolo por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Se muestra la información completa del monumento buscado",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Monumento.class)) })
    })    @GetMapping("/{id}")
    public Monumento findOne(@Parameter(description = "ID del monumento que queremos buscar") @PathVariable("id") Long id) {
        return repository.findById(id).orElse(null);
        // Aquí podríamos usar el método ok() o el método of(), el cual nos devuelve un objeto del tipo
        // que le hayamos pasado por parámetro.
        //
        // public ResponseEntity<Monumento> findOne(@PathVariable Long id) {
        //      return ResponseEntity
        //             .of(repository.findById(id)); Aqui repository.findById(id) devuelve un Optional
        // }                                         que es lo que tenemos que pasarle a ResponseEntity
    }

    // Crear un monumento
    @PostMapping("/")
    // Aunque necesitamos devolver un objeto de tipo monumento, esto devolvería un código 200
    // Pero para los post necesitamos un 201 (created) por lo que usamos la clase ResponseEntity
    // Haciendo uso de esta clase podemos crear una nueva entidad de respuesta
    public ResponseEntity<Monumento> create(@RequestBody Monumento monumento) {
        return ResponseEntity.status(HttpStatus.CREATED) // Modificamos el estado
                .body(repository.save(monumento)); // Creamos el cuerpo de la respuesta y la guardamos
    }

    // Actualizar un monumento
    @PutMapping("/{id}")
    public Monumento edit(@RequestBody Monumento monumento, @PathVariable("id") Long id) {
        Monumento monumentoAntiguo = repository.findById(id).orElse(monumento);

        monumentoAntiguo.setCodigo_pais(monumento.getCodigo_pais());
        monumentoAntiguo.setNombre_pais(monumento.getNombre_pais());
        monumentoAntiguo.setNombre_ciudad(monumento.getNombre_ciudad());
        monumentoAntiguo.setLocalizacion(monumento.getLocalizacion());
        monumentoAntiguo.setNombre(monumento.getNombre());
        monumentoAntiguo.setDescripcion(monumento.getDescripcion());
        monumentoAntiguo.setFoto(monumento.getFoto());

        return repository.save(monumentoAntiguo);

        // OTRA FORMA DE HACERLO!!
        // En lugar de devolver un monumento devolvemos un objeto de tipo ResponseBody<Monumento>
        //
        // return ResponseEntity.of(
        // repository.findById(id).map(m -> {
        //      monumentoAntiguo.setCodigo_pais(monumento.getCodigo_pais());
        //      monumentoAntiguo.setNombre_pais(monumento.getNombre_pais());
        //      monumentoAntiguo.setNombre_ciudad(monumento.getNombre_ciudad());
        //      monumentoAntiguo.setLocalizacion(monumento.getLocalizacion());
        //      monumentoAntiguo.setNombre(monumento.getNombre());
        //      monumentoAntiguo.setDescripcion(monumento.getDescripcion());
        //      monumentoAntiguo.setFoto(monumento.getFoto());
        //      repository.save(m);
        //      return m;
        // })
        // );
        // findById -> Optional
        // map -> Optional
    }

    // Eliminar un monumento
    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") Long id) {
        repository.deleteById(id);
        return ResponseEntity.noContent().build();
        // Usamos noContent para convertir el código de respuesta en 204
        // Además, como es una operación intermedia, necesitamos del método build para acabar de construir el cuerpo
    }

}

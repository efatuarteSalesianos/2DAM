package com.salesianostriana.dam.validations.controladores;

import com.salesianostriana.dam.validations.dto.EstacionDTO;
import com.salesianostriana.dam.validations.modelo.Estacion;
import com.salesianostriana.dam.validations.servicios.EstacionServicio;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/estacion")
public class EstacionControlador {

    private final EstacionServicio servicio;

    @GetMapping("/")
    public List<EstacionDTO> mostrarTodas() {
        return servicio.findAll();
    }

    @GetMapping("/{id}")
    public EstacionDTO buscarEstacion(@PathVariable Long id) {
        return servicio.findById(id).get();
    }

    @PostMapping("/")
    public Estacion crear(@Valid @RequestBody EstacionDTO estacion) {
        return servicio.save(estacion);
    }

    @PutMapping("/{id}")
    public Estacion editar(@PathVariable Long id, @Valid @RequestBody EstacionDTO estacion) {
        return servicio.edit(id, estacion);
    }

    @DeleteMapping("/{id}")
    public void borrar(@PathVariable Long id) {
        servicio.delete(id);
    }

}

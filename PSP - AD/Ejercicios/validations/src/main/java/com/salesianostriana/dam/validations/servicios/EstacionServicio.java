package com.salesianostriana.dam.validations.servicios;

import com.salesianostriana.dam.validations.dto.EstacionDTO;
import com.salesianostriana.dam.validations.dto.EstacionDTOConverter;
import com.salesianostriana.dam.validations.errores.excepciones.ListEntityNotFoundException;
import com.salesianostriana.dam.validations.errores.excepciones.SingleEntityNotFoundException;
import com.salesianostriana.dam.validations.modelo.Estacion;
import com.salesianostriana.dam.validations.repositorios.EstacionRepositorio;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class EstacionServicio {

    private final EstacionRepositorio repositorio;
    private final EstacionDTOConverter dtoConverter;

    public List<EstacionDTO> findAll() {
        List<Estacion> result = repositorio.findAll();

        if (result.isEmpty()) {
            throw new ListEntityNotFoundException(Estacion.class);
        } else {
            return result.stream().map(dtoConverter::estacionToEstacionDTO)
                    .collect(Collectors.toList());
        }
    }

    public Optional<EstacionDTO> findById(Long id) {
        Optional<Estacion> result = repositorio.findById(id);

        if (result.isEmpty()) {
            throw new SingleEntityNotFoundException(id.toString(), Estacion.class);
        } else {
            return result.map(dtoConverter::estacionToEstacionDTO);
        }
    }

    public Estacion save(EstacionDTO estacion) {
        return repositorio.save(Estacion.builder()
                        .nombre(estacion.getNombre())
                        .marca(estacion.getMarca())
                        .ubicacion(estacion.getUbicacion())
                        .tieneAutolavado(estacion.isTieneAutolavado())
                        .precioGasoilEspecial(estacion.getPrecioGasoilEspecial())
                        .precioGasolina95Octanos(estacion.getPrecioGasolina95Octanos())
                        .precioGasoilNormal(estacion.getPrecioGasoilNormal())
                        .precioGasolina98(estacion.getPrecioGasolina98())
                        .servicios(estacion.getServicios())
                        .fechaApertura(estacion.getFechaApertura())
                        .fechaRegistro(estacion.getFechaRegistro())
                        .build());
    }

    public Estacion edit(Long id, EstacionDTO estacion) {
        Optional<Estacion> encontrada = repositorio.findById(id);

        if (encontrada.isEmpty()) {
            throw new SingleEntityNotFoundException(id.toString(), EstacionServicio.class);
        } else {
            return repositorio.save(Estacion.builder()
                    .nombre(estacion.getNombre())
                    .marca(estacion.getMarca())
                    .ubicacion(estacion.getUbicacion())
                    .tieneAutolavado(estacion.isTieneAutolavado())
                    .precioGasoilEspecial(estacion.getPrecioGasoilEspecial())
                    .precioGasolina95Octanos(estacion.getPrecioGasolina95Octanos())
                    .precioGasoilNormal(estacion.getPrecioGasoilNormal())
                    .precioGasolina98(estacion.getPrecioGasolina98())
                    .servicios(estacion.getServicios())
                    .fechaApertura(estacion.getFechaApertura())
                    .fechaRegistro(estacion.getFechaRegistro())
                    .build());
        }
    }

    public void delete(Long id) {
        Optional<Estacion> encontrada = repositorio.findById(id);

        if(encontrada.isEmpty()){
            throw new SingleEntityNotFoundException(id.toString(), EstacionServicio.class);
        }
        else {
            repositorio.delete(encontrada.get());
        }
    }

}

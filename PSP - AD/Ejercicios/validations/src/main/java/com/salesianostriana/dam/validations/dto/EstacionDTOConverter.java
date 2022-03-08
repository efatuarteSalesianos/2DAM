package com.salesianostriana.dam.validations.dto;

import com.salesianostriana.dam.validations.modelo.Estacion;
import org.springframework.stereotype.Component;

@Component
public class EstacionDTOConverter {

    public EstacionDTO estacionToEstacionDTO (Estacion estacion) {
        return EstacionDTO.builder()
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
                .build();
    }
}

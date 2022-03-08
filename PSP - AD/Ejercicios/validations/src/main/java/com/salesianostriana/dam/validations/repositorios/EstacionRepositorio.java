package com.salesianostriana.dam.validations.repositorios;

import com.salesianostriana.dam.validations.modelo.Estacion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EstacionRepositorio extends JpaRepository<Estacion, Long> {

    boolean existsByUbicacion(String ubicacion);
}

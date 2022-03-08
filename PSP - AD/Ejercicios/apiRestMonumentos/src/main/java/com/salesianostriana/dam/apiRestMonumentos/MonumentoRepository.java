package com.salesianostriana.dam.apiRestMonumentos;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MonumentoRepository extends JpaRepository<Monumento, Long> {

    // Aqui ya estarían creados los métodos de búsqueda de todos y por ID
}

package com.salesianostriana.dam.manyToMany.repos;

import com.salesianostriana.dam.manyToMany.model.Asignatura;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AsignaturaRepository extends JpaRepository<Asignatura, Long> {
}

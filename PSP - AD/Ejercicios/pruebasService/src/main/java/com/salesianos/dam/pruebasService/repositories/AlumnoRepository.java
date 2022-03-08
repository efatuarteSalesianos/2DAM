package com.salesianos.dam.pruebasService.repositories;

import com.salesianos.dam.pruebasService.model.Alumno;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlumnoRepository extends JpaRepository<Alumno, Integer> {
}

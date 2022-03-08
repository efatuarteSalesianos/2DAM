package com.salesianostriana.dam.springjpa.repos;

import com.salesianostriana.dam.springjpa.model.Alumno;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlumnoRepository extends JpaRepository<Alumno, Long> {
}

package com.salesianostriana.dam.manyToMany.repos;

import com.salesianostriana.dam.manyToMany.model.Alumno;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlumnoRepository extends JpaRepository<Alumno, Long> {
}

package com.salesianostriana.dam.manyToManyExtra.repos;

import com.salesianostriana.dam.manyToManyExtra.modelos.Alumno;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlumnoRepository extends JpaRepository<Alumno, Long> {
}

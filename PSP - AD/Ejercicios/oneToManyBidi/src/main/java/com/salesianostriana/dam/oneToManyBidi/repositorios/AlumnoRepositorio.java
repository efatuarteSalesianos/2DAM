package com.salesianostriana.dam.oneToManyBidi.repositorios;

import com.salesianostriana.dam.oneToManyBidi.modelos.Alumno;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlumnoRepositorio extends JpaRepository<Alumno, Long> {
}

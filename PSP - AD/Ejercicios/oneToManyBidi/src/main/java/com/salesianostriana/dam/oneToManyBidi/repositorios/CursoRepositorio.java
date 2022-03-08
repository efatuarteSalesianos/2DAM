package com.salesianostriana.dam.oneToManyBidi.repositorios;

import com.salesianostriana.dam.oneToManyBidi.modelos.Curso;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CursoRepositorio extends JpaRepository<Curso, Long> {
}

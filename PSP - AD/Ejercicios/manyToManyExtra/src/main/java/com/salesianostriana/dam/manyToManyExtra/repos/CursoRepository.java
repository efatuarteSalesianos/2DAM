package com.salesianostriana.dam.manyToManyExtra.repos;

import com.salesianostriana.dam.manyToManyExtra.modelos.Curso;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CursoRepository extends JpaRepository<Curso, Long> {
}

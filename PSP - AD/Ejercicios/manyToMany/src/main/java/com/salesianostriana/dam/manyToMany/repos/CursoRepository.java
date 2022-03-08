package com.salesianostriana.dam.manyToMany.repos;

import com.salesianostriana.dam.manyToMany.model.Curso;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CursoRepository extends JpaRepository<Curso, Long> {
}

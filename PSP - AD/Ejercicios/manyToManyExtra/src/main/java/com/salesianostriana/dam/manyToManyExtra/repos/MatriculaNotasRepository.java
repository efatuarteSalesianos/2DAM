package com.salesianostriana.dam.manyToManyExtra.repos;

import com.salesianostriana.dam.manyToManyExtra.modelos.MatriculaNotas;
import com.salesianostriana.dam.manyToManyExtra.modelos.NotasPK;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MatriculaNotasRepository extends JpaRepository<MatriculaNotas, NotasPK> {
}

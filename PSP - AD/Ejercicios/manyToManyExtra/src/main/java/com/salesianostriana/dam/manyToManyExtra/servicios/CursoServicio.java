package com.salesianostriana.dam.manyToManyExtra.servicios;

import com.salesianostriana.dam.manyToManyExtra.modelos.Curso;
import com.salesianostriana.dam.manyToManyExtra.repos.CursoRepository;
import com.salesianostriana.dam.manyToManyExtra.servicios.base.BaseService;

public class CursoServicio extends BaseService<Curso, Long, CursoRepository> {

    public CursoServicio(CursoRepository repo) {
        super(repo);
    }
}

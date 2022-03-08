package com.salesianostriana.dam.manyToMany.services;

import com.salesianostriana.dam.manyToMany.model.Curso;
import com.salesianostriana.dam.manyToMany.repos.CursoRepository;
import com.salesianostriana.dam.manyToMany.services.base.BaseService;
import org.springframework.stereotype.Service;

@Service
public class CursoService extends BaseService<Curso, Long, CursoRepository> {

    public CursoService (CursoRepository repo) {
        super(repo);
    }
}

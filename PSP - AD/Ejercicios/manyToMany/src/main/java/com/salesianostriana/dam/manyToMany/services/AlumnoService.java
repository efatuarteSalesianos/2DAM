package com.salesianostriana.dam.manyToMany.services;

import com.salesianostriana.dam.manyToMany.model.Alumno;
import com.salesianostriana.dam.manyToMany.repos.AlumnoRepository;
import com.salesianostriana.dam.manyToMany.services.base.BaseService;
import org.springframework.stereotype.Service;

@Service
public class AlumnoService extends BaseService<Alumno, Long, AlumnoRepository> {

    public AlumnoService(AlumnoRepository repo) {
        super(repo);
    }
}

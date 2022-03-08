package com.salesianostriana.dam.manyToManyExtra.servicios;

import com.salesianostriana.dam.manyToManyExtra.modelos.Alumno;
import com.salesianostriana.dam.manyToManyExtra.repos.AlumnoRepository;
import com.salesianostriana.dam.manyToManyExtra.servicios.base.BaseService;

public class AlumnoServicio extends BaseService<Alumno, Long, AlumnoRepository> {

    public AlumnoServicio(AlumnoRepository repo) {
        super(repo);
    }
}

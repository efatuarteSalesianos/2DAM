package com.salesianostriana.dam.manyToManyExtra.servicios;

import com.salesianostriana.dam.manyToManyExtra.modelos.Asignatura;
import com.salesianostriana.dam.manyToManyExtra.repos.AsignaturaRepository;
import com.salesianostriana.dam.manyToManyExtra.servicios.base.BaseService;

public class AsignaturaServicio extends BaseService<Asignatura, Long, AsignaturaRepository> {

    public AsignaturaServicio(AsignaturaRepository repo) {
        super(repo);
    }
}

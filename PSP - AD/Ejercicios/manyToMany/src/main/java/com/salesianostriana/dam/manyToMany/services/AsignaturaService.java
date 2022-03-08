package com.salesianostriana.dam.manyToMany.services;

import com.salesianostriana.dam.manyToMany.model.Asignatura;
import com.salesianostriana.dam.manyToMany.repos.AsignaturaRepository;
import com.salesianostriana.dam.manyToMany.services.base.BaseService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AsignaturaService extends BaseService<Asignatura, Long, AsignaturaRepository> {

    public AsignaturaService (AsignaturaRepository repo) {
        super(repo);
    }

    // Reescribimos el método saveAll para poder utilizarlo desde este servicio
    public List<Asignatura> saveAll(Iterable<Asignatura> list) {
        return this.repositorio.saveAll(list);
    }
}

package com.salesianostriana.dam.springdata.services;

import com.salesianostriana.dam.springdata.model.Alumno;
import com.salesianostriana.dam.springdata.repos.AlumnoRepository;
import com.salesianostriana.dam.springdata.services.base.BaseService;
import org.springframework.stereotype.Service;

@Service
public class AlumnoService extends BaseService<Alumno, Long, AlumnoRepository> {
}

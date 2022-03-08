package com.salesianos.com.ejercicioHerencias.services;

import com.salesianos.com.ejercicioHerencias.model.Empleado;
import com.salesianos.com.ejercicioHerencias.repos.EmpleadoRepository;
import com.salesianos.com.ejercicioHerencias.services.base.BaseService;
import org.springframework.stereotype.Service;

@Service
public class EmpleadoService extends BaseService<Empleado, Long, EmpleadoRepository> {
}

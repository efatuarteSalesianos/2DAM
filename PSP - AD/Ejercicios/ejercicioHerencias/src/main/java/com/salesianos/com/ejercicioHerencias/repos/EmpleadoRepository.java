package com.salesianos.com.ejercicioHerencias.repos;

import com.salesianos.com.ejercicioHerencias.model.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpleadoRepository extends JpaRepository<Empleado, Long> {
}

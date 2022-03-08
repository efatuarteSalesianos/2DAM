package com.salesianostriana.dam.validations.validaciones.validadores;

import com.salesianostriana.dam.validations.repositorios.EstacionRepositorio;
import com.salesianostriana.dam.validations.validaciones.anotaciones.UniqueUbicacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueUbicacionValidator implements ConstraintValidator<UniqueUbicacion, String> {

    @Autowired
    private EstacionRepositorio repositorio;

    @Override
    public void initialize(UniqueUbicacion constraintAnnotation) { }

    @Override
    public boolean isValid(String ubicacion, ConstraintValidatorContext context) {
        return StringUtils.hasText(ubicacion) && !repositorio.existsByUbicacion(ubicacion);
    }
}

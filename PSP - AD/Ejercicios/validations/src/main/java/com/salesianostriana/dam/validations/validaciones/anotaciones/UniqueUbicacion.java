package com.salesianostriana.dam.validations.validaciones.anotaciones;

import com.salesianostriana.dam.validations.validaciones.validadores.UniqueUbicacionValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueUbicacionValidator.class)
@Documented
public @interface UniqueUbicacion {

    String message() default "No pueden existir dos ubicaciones iguales. Por favor, indique una nueva ubicación";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}

package com.salesianostriana.dam.validations.validaciones.anotaciones;

import com.salesianostriana.dam.validations.validaciones.validadores.CompareDatesValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Constraint(validatedBy = CompareDatesValidator.class)
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CompareDates {

    String message() default "La fecha introducida debe ser posterior a la fecha dada. Por favor, indique una nueva fecha";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    String fecha1();
    String fecha2();

    @Target({ ElementType.TYPE })
    @Retention(RetentionPolicy.RUNTIME)
    @interface List {
        CompareDates[] value();
    }
}

package com.salesianostriana.dam.validations.validaciones.validadores;

import com.salesianostriana.dam.validations.validaciones.anotaciones.CompareDates;
import org.springframework.beans.PropertyAccessorFactory;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDateTime;

public class CompareDatesValidator implements ConstraintValidator<CompareDates, Object> {

    private String fecha1;
    private String fecha2;

    @Override
    public void initialize(CompareDates constraintAnnotation) {
        this.fecha1 = constraintAnnotation.fecha1();
        this.fecha2 = constraintAnnotation.fecha2();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {

        LocalDateTime fieldValue = (LocalDateTime) PropertyAccessorFactory.forBeanPropertyAccess(value).getPropertyValue(fecha1);
        LocalDateTime fieldMatchValue = (LocalDateTime) PropertyAccessorFactory.forBeanPropertyAccess(value).getPropertyValue(fecha2);

        return fieldMatchValue.isAfter(fieldValue);
    }
}

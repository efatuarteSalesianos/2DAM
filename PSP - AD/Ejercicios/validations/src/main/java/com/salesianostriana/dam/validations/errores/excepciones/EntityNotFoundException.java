package com.salesianostriana.dam.validations.errores.excepciones;

public class EntityNotFoundException extends RuntimeException{

    public EntityNotFoundException(String message) {
        super(message);
    }
}

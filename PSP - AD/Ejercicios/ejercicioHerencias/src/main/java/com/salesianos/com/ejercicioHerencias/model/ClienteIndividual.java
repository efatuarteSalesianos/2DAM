package com.salesianos.com.ejercicioHerencias.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
@SuperBuilder
@DiscriminatorValue("I")
public class ClienteIndividual extends Cliente implements Serializable {

    private String dni, apellidos;
    private LocalDateTime fecha_nacimiento;
}

package com.salesianos.com.ejercicioHerencias.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import net.bytebuddy.implementation.bind.annotation.Super;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
@SuperBuilder
@DiscriminatorValue("C")
public class ClienteCorporativo extends Cliente implements Serializable {

    private String cif;

    @ManyToOne
    private Empleado empleado;
}

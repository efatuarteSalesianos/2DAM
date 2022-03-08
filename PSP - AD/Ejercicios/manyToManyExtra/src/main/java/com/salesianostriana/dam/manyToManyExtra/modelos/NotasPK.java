package com.salesianostriana.dam.manyToManyExtra.modelos;

import lombok.*;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import java.io.Serializable;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter @ToString
@Embeddable
public class NotasPK implements Serializable {

    long alumno_id;
    long asignatura_id;

}


    //private static final long serialVersionUID = 8682909319466153524L;

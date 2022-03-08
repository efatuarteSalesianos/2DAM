package com.salesianos.com.ejercicioHerencias.model;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
@Builder
@EntityListeners(AuditingEntityListener.class)
public class Pedido implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreatedDate
    private LocalDateTime fecha_realizacion;

    private LocalDateTime fecha_entrega;

    // Nos permite asignar los valores de la enumeración a un String
    @Enumerated(EnumType.STRING)
    private EstadoPedido estado;

    private String observaciones, metodo_pago;

    @ManyToOne
    private Cliente cliente;

}

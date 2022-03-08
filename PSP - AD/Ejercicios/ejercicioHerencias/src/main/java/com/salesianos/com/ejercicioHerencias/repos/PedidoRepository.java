package com.salesianos.com.ejercicioHerencias.repos;

import com.salesianos.com.ejercicioHerencias.model.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {
}

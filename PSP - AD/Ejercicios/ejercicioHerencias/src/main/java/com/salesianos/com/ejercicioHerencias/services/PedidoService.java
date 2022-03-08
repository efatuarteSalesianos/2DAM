package com.salesianos.com.ejercicioHerencias.services;

import com.salesianos.com.ejercicioHerencias.model.Pedido;
import com.salesianos.com.ejercicioHerencias.repos.PedidoRepository;
import com.salesianos.com.ejercicioHerencias.services.base.BaseService;
import org.springframework.stereotype.Service;

@Service
public class PedidoService extends BaseService<Pedido, Long, PedidoRepository> {
}

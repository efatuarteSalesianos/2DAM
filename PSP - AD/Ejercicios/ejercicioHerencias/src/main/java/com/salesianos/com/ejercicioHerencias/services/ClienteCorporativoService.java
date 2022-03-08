package com.salesianos.com.ejercicioHerencias.services;

import com.salesianos.com.ejercicioHerencias.model.ClienteCorporativo;
import com.salesianos.com.ejercicioHerencias.repos.ClienteCorporativoRepository;
import com.salesianos.com.ejercicioHerencias.services.base.BaseService;
import org.springframework.stereotype.Service;

@Service
public class ClienteCorporativoService extends BaseService<ClienteCorporativo, Long, ClienteCorporativoRepository> {
}

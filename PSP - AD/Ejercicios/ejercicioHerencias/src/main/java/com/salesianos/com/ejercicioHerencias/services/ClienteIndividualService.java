package com.salesianos.com.ejercicioHerencias.services;

import com.salesianos.com.ejercicioHerencias.model.ClienteIndividual;
import com.salesianos.com.ejercicioHerencias.repos.ClienteIndividualRepository;
import com.salesianos.com.ejercicioHerencias.services.base.BaseService;
import org.springframework.stereotype.Service;

@Service
public class ClienteIndividualService extends BaseService<ClienteIndividual, Long, ClienteIndividualRepository> {
}

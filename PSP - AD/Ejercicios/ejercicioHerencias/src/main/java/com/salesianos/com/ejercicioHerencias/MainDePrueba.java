package com.salesianos.com.ejercicioHerencias;

import com.salesianos.com.ejercicioHerencias.model.ClienteCorporativo;
import com.salesianos.com.ejercicioHerencias.model.ClienteIndividual;
import com.salesianos.com.ejercicioHerencias.services.ClienteCorporativoService;
import com.salesianos.com.ejercicioHerencias.services.ClienteIndividualService;
import com.salesianos.com.ejercicioHerencias.services.ClienteService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.time.LocalDateTime;

@Component
@RequiredArgsConstructor
public class MainDePrueba {

    private final ClienteService clienteService;
    private final ClienteCorporativoService ccService;
    private final ClienteIndividualService ciService;

    @PostConstruct
    public void initData() {

        ClienteCorporativo cc1 = ClienteCorporativo.builder()
                .nombre("Empresa de prueba")
                .email("empresa_prueba@dominio.com")
                .direccion("Direccion empresa, sn, planta 4")
                .telefono("555 555 555")
                .cif("A - 00000000")
                .build();
        ccService.save(cc1);

        ClienteIndividual cliente1 = ClienteIndividual.builder()
                .nombre("Luis Miguel")
                .apellidos("López Magaña")
                .email("luismi.lopez@salesianos.edu")
                .direccion("Calle de prueba, n1")
                .telefono("666 666 666")
                .fecha_nacimiento(LocalDateTime.now())
                .build();
        ClienteIndividual cliente2 = ClienteIndividual.builder()
                .nombre("Miguel")
                .apellidos("Campos Rivera")
                .email("miguel.campos@salesianos.edu")
                .direccion("Calle de prueba, n2")
                .telefono("777 777 777")
                .fecha_nacimiento(LocalDateTime.now())
                .build();

        ciService.save(cliente1);
        ciService.save(cliente2);

        System.out.println("Empresas:");
        ccService.findAll().forEach(System.out::println);

        System.out.println("\nClientes Individuales:");
        ciService.findAll().forEach(System.out::println);

        System.out.println("\nTodos los clientes:");
        clienteService.findAllClientes().forEach(System.out::println);

        System.out.println("\nBusco por nombre de cliente:");
        System.out.println(clienteService.findClienteByNombre("Miguel"));
    }
}

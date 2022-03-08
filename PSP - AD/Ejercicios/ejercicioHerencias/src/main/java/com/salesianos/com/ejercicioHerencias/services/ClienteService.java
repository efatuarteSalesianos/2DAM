package com.salesianos.com.ejercicioHerencias.services;

import com.salesianos.com.ejercicioHerencias.model.Cliente;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ClienteService {

    private EntityManager entityManager;

    public Cliente findClienteByNombre(String nombre) {

        Cliente clienteEncontrado = null;

        TypedQuery<Cliente> query = entityManager.createQuery("select c from Cliente c where c.nombre = :nombreBuscado",
                Cliente.class);

        try {
            clienteEncontrado = query.setParameter("nombreBuscado", nombre).getSingleResult();
        } catch (NoResultException | NonUniqueResultException ex) {
            clienteEncontrado = null;
        }

        return clienteEncontrado;
    }

    public List<Cliente> findAllClientes() {

        List<Cliente> listaClientes = null;

        TypedQuery<Cliente> query = entityManager.createQuery("select c from Cliente c", Cliente.class);

        try {
            listaClientes = query.getResultList();
        } catch (NoResultException e) {
            listaClientes = null;
        }

        return listaClientes;
    }

    public List<Cliente> listarClientesCorporativos() {

        List<Cliente> listaClientesCorporativos = null;

        TypedQuery<Cliente> query = entityManager.createQuery("select c from Cliente c where Type(C)", Cliente.class);

        try {
            listaClientesCorporativos = query.getResultList();
        } catch (NoResultException e) {
            listaClientesCorporativos = null;
        }

        return listaClientesCorporativos;
    }

}

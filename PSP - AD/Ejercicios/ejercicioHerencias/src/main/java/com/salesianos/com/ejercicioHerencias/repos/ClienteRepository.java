package com.salesianos.com.ejercicioHerencias.repos;

import com.salesianos.com.ejercicioHerencias.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

// Creo un repositorio base, del cual extenderán los repositorios de las clases hijas
// y lo anotamos con @NoRepositoryBean para que no se cree un bean del repo
@NoRepositoryBean
public interface ClienteRepository<T extends Cliente> extends JpaRepository<T, Long> {

    // Creo este método para buscar un cliente por su nombre, bien sea corporativo o individual
    public T findClienteByNombre(String nombre);

    public T listarClientesCorporativos(Cliente c);
}

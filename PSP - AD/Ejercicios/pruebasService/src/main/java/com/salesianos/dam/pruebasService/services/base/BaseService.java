package com.salesianos.dam.pruebasService.services.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

// El servicio base debe ser una clase abstracta, esto quiere decir que no podemos crear una instancia de esta clase
public abstract class BaseService<T, ID, R extends JpaRepository<T, ID>> {
    // Aquí añadimos los siguientes genéricos
    // T -> Tipo de la entidad
    // ID -> Tipo del ID
    // R -> Tipo del repositorio

    // A continuación, inyectamos la dependencia del repositorio genérico
    // Usaremos la notación @Autowired para no tener que crear constructores
    @Autowired
    protected R repositorio;
    // Lo pondremos con el modificador de acceso protected, de forma que puedan acceder
    // las clases que extiendan a BaseService

    // Por último, crearemos los métodos necesarios
    public List<T> findAll() {
        return repositorio.findAll();
    }

    public Optional<T> findById(ID id) {
        return repositorio.findById(id);
    }

    public T save(T t) {
        return repositorio.save(t);
    }

    public T edit(T t) {
        return save(t);
    }

    public void delete(T t) {
        repositorio.delete(t);
    }

    public void deleteById(ID id) {
        repositorio.deleteById(id);
    }
}

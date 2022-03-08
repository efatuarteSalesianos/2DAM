package com.salesianostriana.dam.manyToMany.services.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public abstract class BaseService<T, ID, R extends JpaRepository<T, ID>> {

    @Autowired
    protected R repositorio;

    /**
     * Almacenamos una nueva entidad a través del repositorio
     * @param t
     * @return
     */
    @Override
    public T save(T t) {
        return repositorio.save(t);
    }

    /**
     * Localizamos una entidad en base a su Id
     *
     * @param id
     * @return
     */
    @Override
    public T findById(ID id) {
        return repositorio.findById(id).orElse(null);
    }

    /**
     * Obtenemos todas las entidades de un tipo de entidad
     * @return
     */
    @Override
    public List<T> findAll() {
        return repositorio.findAll();
    }

    /**
     * Editamos una instancia de una entidad (si no tiene Id, la insertamos).
     * @param t
     * @return
     */
    @Override
    public T edit(T t) {
        return repositorio.save(t);
    }

    /**
     * Eliminamos una instancia de una entidad
     * @param t
     */
    @Override
    public void delete(T t) {
        repositorio.delete(t);
    }

    /**
     * Eliminamos una instancia en base a su ID
     * @param id
     */
    @Override
    public void deleteById(ID id) {
        repositorio.deleteById(id);
    }
}

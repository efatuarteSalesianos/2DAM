package com.salesianostriana.dam.springjpa;

import com.salesianostriana.dam.springjpa.repos.AlumnoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
@RequiredArgsConstructor
public class MainPrueba {

    private final AlumnoRepository repository;

    @PostConstruct
    public void test() {
        
    }

}

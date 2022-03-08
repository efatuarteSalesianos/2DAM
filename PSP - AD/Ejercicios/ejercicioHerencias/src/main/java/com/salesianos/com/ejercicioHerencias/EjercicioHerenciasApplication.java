package com.salesianos.com.ejercicioHerencias;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class EjercicioHerenciasApplication {

	public static void main(String[] args) {
		SpringApplication.run(EjercicioHerenciasApplication.class, args);
	}

}

package com.salesianostriana.dam.primerproyectodatajpa.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.*;

@Entity
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class Curso {

	@Id @GeneratedValue
	private long id;
	
	private String nombre;
	private String tutor;
	
	
	public Curso(String nombre, String tutor) {
		this.nombre = nombre;
		this.tutor = tutor;
	}
	
	
	
	
}

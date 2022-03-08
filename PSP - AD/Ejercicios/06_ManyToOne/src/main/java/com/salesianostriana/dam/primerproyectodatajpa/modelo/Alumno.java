package com.salesianostriana.dam.primerproyectodatajpa.modelo;

import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@Entity
public class Alumno {
	
	@Id
	@GeneratedValue
	private long id;
	
	private String nombre, apellidos, email;

	@JoinColumn(name = "fk_curso", nullable = false)
	@ManyToOne
	private Curso curso;
	
	public Alumno(String n, String a, String e) {
		this.nombre = n;
		this.apellidos = a;
		this.email = e;
	}

	public Alumno(String nombre, String apellidos, String email, Curso curso) {
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.curso = curso;
	}
	
	

}

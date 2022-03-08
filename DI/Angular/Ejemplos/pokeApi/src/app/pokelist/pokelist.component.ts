import { PokemonService } from './../services/pokemon.service';
import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Pokemon } from '../interfaces/pokelist.interface';

@Component({
  selector: 'app-pokelist',
  templateUrl: './pokelist.component.html',
  styleUrls: ['./pokelist.component.css']
})
export class PokelistComponent implements OnInit {

  displayedColumns: string[] = ['name', 'link'];
  listadoPokemon = new MatTableDataSource();
  pokemonList: Pokemon[] | undefined;
  cantidadPokemon = 0;
  pokemonSelected = '';

  constructor(private pokemonService: PokemonService) { }

  ngOnInit(): void {

    this.getPokemonList(50);
  }

  getPokemonList(limit: number) {
    this.pokemonService.getPokemonList(limit).subscribe(resultado => {
      this.pokemonList = resultado.results;
    });
  }

  getPokemon(name: string) {
    return name;
  }

  getPokemonPhotoUrl(url: string): string {
    let idPokemon = url.split("/")[6];
    return `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${idPokemon}.png`;
  }

  getPokemonPhotoShinyUrl(url: string): string {
    let idPokemon = url.split("/")[6];
    return `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/${idPokemon}.png`;
  }

}

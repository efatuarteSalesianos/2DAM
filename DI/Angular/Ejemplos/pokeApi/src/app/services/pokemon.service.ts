import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PokemonResponse } from '../interfaces/pokelist.interface';

const POKEMON_BASE_URL = 'https://pokeapi.co/api/v2';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  limit = 50;

  constructor(private http: HttpClient) { }

  public getPokemonList(limit: number): Observable<PokemonResponse> {
    return this.http.get<PokemonResponse>(`${POKEMON_BASE_URL}/pokemon/?limit=${limit}`);
  }
}

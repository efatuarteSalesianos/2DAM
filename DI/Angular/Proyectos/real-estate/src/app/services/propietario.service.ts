import { PropietarioResponse } from './../model/interfaces/propietario.interface';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { PropietarioListResponse } from '../model/interfaces/propietario-list.interface';
import { Vivienda } from '../model/interfaces/vivienda.interface';
import { PropietarioDTO } from '../model/dto/propietario.dto';

const PROPIETARIO_BASE_URL = 'propietario';
const VIVIENDA_BASE_URL = 'vivienda';
const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class PropietarioService {

  propietarioBaseUrl = `${environment.api_base_url}/${PROPIETARIO_BASE_URL}`;
  viviendaBaseUrl = `${environment.api_base_url}/${VIVIENDA_BASE_URL}`;

  constructor(private http: HttpClient) { }

  getPropietario(id: number) {
    let url = `${this.propietarioBaseUrl}/${id}`;
    console.log("PROPIETARIO URL: " + url);
    return this.http.get<PropietarioResponse>(url, DEFAULT_HEADERS);
  }

  getTopPropietarios(): Observable<PropietarioResponse[]> {
    let requestUrl = `${this.propietarioBaseUrl}/top`;
    return this.http.get<PropietarioResponse[]>(requestUrl, DEFAULT_HEADERS);
  }

  getPropietarioList(paginacion: number): Observable<PropietarioListResponse>{
    return this.http.get<PropietarioListResponse>(`${this.propietarioBaseUrl}/?size=${paginacion}`)
  }
  getPropietariosList(): Observable<PropietarioListResponse>{
    return this.http.get<PropietarioListResponse>(`${environment.api_base_url}/propietario/`);
  }

  getViviendasPropietario(id: number): Observable<Vivienda[]> {
    let requestUrl = `${this.viviendaBaseUrl}/${PROPIETARIO_BASE_URL}/${id}/viviendas/`;
    return this.http.get<Vivienda[]>(requestUrl, DEFAULT_HEADERS);
  }

  addPropietario(propietarioDTO: PropietarioDTO): Observable<PropietarioResponse> {
    let requestUrl = `${this.propietarioBaseUrl}/`;
    return this.http.post<PropietarioResponse>(requestUrl, propietarioDTO, DEFAULT_HEADERS);
  }

  deletePropietario(id: number){
    let requestUrl = `${this.propietarioBaseUrl}`;
    return this.http.delete<PropietarioResponse>(`${requestUrl}/${id}`);
  }
  
}

import { InmobiliariaResponse } from './../model/interfaces/inmobiliaria.interface';
import { InmobiliariaDTO } from './../model/dto/inmobiliaria.dto';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Inmobiliaria, InmobiliariaListResponse } from '../model/interfaces/inmobiliaria-list.interface';
import { Vivienda } from '../model/interfaces/vivienda.interface';

const INMOBILIARIA_BASE_URL = 'inmobiliaria';

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class InmobiliariaService {

  inmobiliariaBaseUrl = `${environment.api_base_url}/${INMOBILIARIA_BASE_URL}`;

  constructor(private http: HttpClient) { }

  addInmobiliaria(inmobiliariaDTO: InmobiliariaDTO): Observable<InmobiliariaResponse> {
    let requestUrl = `${this.inmobiliariaBaseUrl}/`;
    return this.http.post<InmobiliariaResponse>(requestUrl, inmobiliariaDTO, DEFAULT_HEADERS);
  }

  getTopInmobiliarias(): Observable<InmobiliariaResponse[]> {
    let requestUrl = `${this.inmobiliariaBaseUrl}/top`;
    return this.http.get<InmobiliariaResponse[]>(requestUrl, DEFAULT_HEADERS);
  }

  deleteInmobiliaria(id:number){
    let requestUrl = `${this.inmobiliariaBaseUrl}/${id}`;
    return this.http.delete<InmobiliariaResponse>(`${this.inmobiliariaBaseUrl}/${id}`);
  }

  getInmobiliariaList(paginacion: number): Observable<InmobiliariaListResponse>{
    return this.http.get<InmobiliariaListResponse>(`${this.inmobiliariaBaseUrl}/?size=${paginacion}`)
  }

  getInmobiliariasList(): Observable<InmobiliariaListResponse>{
    return this.http.get<InmobiliariaListResponse>(`${environment.api_base_url}/inmobiliaria/`);
  }

  getInmobiliaria(id: number) {
    let url = `${this.inmobiliariaBaseUrl}/${id}`;
    return this.http.get<InmobiliariaResponse>(url);  }
}

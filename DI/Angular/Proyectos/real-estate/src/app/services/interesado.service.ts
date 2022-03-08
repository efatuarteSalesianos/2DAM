import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { InteresadoResponse } from '../model/interfaces/interesado.interface';
import { Vivienda } from '../model/interfaces/vivienda.interface';

const INTERESADO_BASE_URL = 'interesado';
const VIVIENDA_BASE_URL = 'vivienda';

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}
@Injectable({
  providedIn: 'root'
})
export class InteresadoService {

  interesadoBaseUrl = `${environment.api_base_url}/${INTERESADO_BASE_URL}`;
  viviendaBaseUrl = `${environment.api_base_url}/${VIVIENDA_BASE_URL}`;

  constructor(private http: HttpClient) { }

  getInteresado(id: number) {
    let url = `${this.interesadoBaseUrl}/${id}`;
    return this.http.get<InteresadoResponse>(url, DEFAULT_HEADERS);
  }

}

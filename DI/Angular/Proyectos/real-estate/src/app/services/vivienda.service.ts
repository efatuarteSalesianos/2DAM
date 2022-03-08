import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ViviendaNuevaDto } from '../model/dto/vivienda.dto';
import { Vivienda, ViviendaEdit, ViviendaNueva } from '../model/interfaces/vivienda.interface';
import { ViviendaListResponse } from '../model/interfaces/vivienda-list.interface';
import { InteresaConInteresadoDTO } from '../model/dto/interesa-interesado.dto';
import { InteresaConInteresadoResponse } from '../model/interfaces/interesa-interesado.interface';

const VIVIENDA_BASE_URL = 'vivienda';

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class ViviendaService {

  viviendaBaseUrl = `${environment.api_base_url}/${VIVIENDA_BASE_URL}`;

  constructor(private http: HttpClient) { }

  getVivienda(id: number): Observable<Vivienda> {
    let requestUrl = `${this.viviendaBaseUrl}/${id}`;
    return this.http.get<Vivienda>(requestUrl, DEFAULT_HEADERS);
  }

  postVivienda(viviendaNuevaDto: ViviendaNuevaDto): Observable<ViviendaNuevaDto> {
    let requestUrl = `${this.viviendaBaseUrl}/`;
    return this.http.post<ViviendaNuevaDto>(requestUrl,viviendaNuevaDto, DEFAULT_HEADERS);
  }

  getViviendaList(paginacion: number,
    titulo: String,
    provincia: string,
    direccion: string,
    poblacion: string,
    condigoPostal: string,
    numBanyos: string,
    numHabitaciones: string,
    metrosCuadrados: string,
    precio: string,
    tienePiscina: string,
    tieneAscensor: string,
    tieneGaraje: string,
    estado: string,
    tipo: string): Observable<ViviendaListResponse>{

    return this.http.get<ViviendaListResponse>(`${this.viviendaBaseUrl}/?page=${paginacion}&titulo=${titulo}&provincia=${provincia}&direccion=${direccion}&poblacion=${poblacion}&codigoPostal=${condigoPostal}&numBanyos=${numBanyos}&numHabitaciones=${numHabitaciones}&metrosCuadrados=${metrosCuadrados}&precio=${precio}&tienePiscina=${tienePiscina}&tieneAscensor=${tieneAscensor}&tieneGaraje=${tieneGaraje}&estado=${estado}&tipo=${tipo}`)
  }

  getTopViviendas(): Observable<Vivienda[]> {
    let requestUrl = `${this.viviendaBaseUrl}/top`;
    return this.http.get<Vivienda[]>(requestUrl, DEFAULT_HEADERS);
  }

  deleteVivienda(id:number){
    let requestUrl = `${this.viviendaBaseUrl}/${id}`;
    return this.http.delete<Vivienda>(requestUrl, DEFAULT_HEADERS);
  }

  editarVivienda(vivienda: Vivienda): Observable<ViviendaEdit> {
    let requestUrl = `${this.viviendaBaseUrl}/${vivienda.id}`;
    return this.http.put<ViviendaEdit>(requestUrl, vivienda, DEFAULT_HEADERS);
  }

  deleteInmobiliariaFromVivienda(id:number, id2:number){
    let requestUrl = `${this.viviendaBaseUrl}/${id}/inmobiliaria/${id2}`;
    return this.http.post<Vivienda>(requestUrl, DEFAULT_HEADERS);
  }

  addInmobiliariaFromVivienda(id:number, id2:number){
    let requestUrl = `${this.viviendaBaseUrl}/${id}/inmobiliaria/${id2}`;
    return this.http.post<Vivienda>(requestUrl, DEFAULT_HEADERS);
  }

  createInteresaAndInteresado(id: number, interesaDTO: InteresaConInteresadoDTO): Observable<InteresaConInteresadoResponse> {
    let requestUrl = `${this.viviendaBaseUrl}/${id}/meinteresa`;
    return this.http.post<InteresaConInteresadoResponse>(requestUrl, interesaDTO, DEFAULT_HEADERS);
  }

}

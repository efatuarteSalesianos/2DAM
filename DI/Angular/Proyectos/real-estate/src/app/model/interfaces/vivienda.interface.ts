import { InmobiliariaResponse } from './inmobiliaria.interface';
import { PropietarioResponse } from './propietario.interface';
import { InteresaResponse } from "./interesa.interface";

export interface Vivienda {
  id: number;
  titulo: string;
  precio: number;
  tipo: string;
  descripcion: string;
  direccion: string;
  latlng: string
  metrosCuadrados: number;
  numHabitaciones: number;
  numBanyos: number;
  avatarVivienda: string;
  avatarPropietario: string;
  tienePiscina: boolean;
  tieneAscensor: boolean;
  tieneGaraje: boolean;
  avatar: string;
  intereses: number;
  email: string;
  telefono: string;
  poblacion: string;
  codigoPostal: number;
  provincia: string;
  estado: string;
  nombre: string;
  apellidos: string;
  interesados: InteresaResponse[];
  propietarioId: number;
  inmobiliariaId: number;
}

export interface ViviendaNueva {
  titulo: string;
  precio: number;
  tipo: string;
  descripcion: string;
  direccion: string;
  metrosCuadrados: number;
  numHabitaciones: number;
  numBanyos: number;
  avatar: string;
  latlng: string;
  tienePiscina: boolean;
  tieneAscensor: boolean;
  tieneGaraje: boolean;
  intereses: number;
  email: string;
  telefono: string;
  poblacion: string;
  codigoPostal: number;
  provincia: string;
  estado: string;
  propietarioId: number;
  inmobiliariaId:number;
}

export interface ViviendaEdit {
  titulo: string;
  precio: number;
  tipo: string;
  descripcion: string;
  direccion: string;
  metrosCuadrados: number;
  numHabitaciones: number;
  numBanyos: number;
  avatar: string;
  latlng: string;
  tienePiscina: boolean;
  tieneAscensor: boolean;
  tieneGaraje: boolean;
  intereses: number;
  email: string;
  telefono: string;
  poblacion: string;
  codigoPostal: number;
  provincia: string;
  estado: string;
  Propietario: PropietarioResponse;
  Inmobiliaria: InmobiliariaResponse;
}

import { Vivienda } from "./vivienda.interface";

export interface PropietarioResponse {
  id: number;
  nombre: string;
  apellidos: string;
  direccion: string;
  email: string;
  telefono: string;
  avatar: string;
  listaViviendas: Vivienda[];
}

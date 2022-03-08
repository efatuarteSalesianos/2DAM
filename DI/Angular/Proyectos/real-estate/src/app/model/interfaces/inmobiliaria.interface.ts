import { Vivienda } from "./vivienda.interface";

export interface InmobiliariaResponse {
  id: number;
  nombre: string;
  telefono: string;
  email: string;
  avatar: string;
  listaViviendas: Vivienda[];
}

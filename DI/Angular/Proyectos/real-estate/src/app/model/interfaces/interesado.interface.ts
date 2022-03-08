import { InteresaResponse } from "./interesa.interface";
export interface InteresadoResponse {
  id: number;
  nombre: string;
  apellidos: string;
  direccion: string;
  email: string;
  telefono: string;
  avatar: string;
  intereses: InteresaResponse[];
}

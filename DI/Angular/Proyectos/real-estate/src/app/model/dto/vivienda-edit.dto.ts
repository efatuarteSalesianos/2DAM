export class ViviendaEdit {
  id: number;
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
  poblacion: string;
  codigoPostal: number;
  provincia: string;
  estado: string;

  constructor() {
    this.id = 0;
    this.titulo = '';
    this.precio = 0;
    this.tipo = '';
    this.descripcion = '';
    this.direccion = '';
    this.metrosCuadrados = 0;
    this.numHabitaciones = 0;
    this.numBanyos = 0;
    this.avatar = '';
    this.latlng = '';
    this.tienePiscina = false;
    this.tieneAscensor = false;
    this.tieneGaraje = false;
    this.intereses = 0;
    this.poblacion = '';
    this.codigoPostal = 0;
    this.provincia = '';
    this.estado = '';
  }
}

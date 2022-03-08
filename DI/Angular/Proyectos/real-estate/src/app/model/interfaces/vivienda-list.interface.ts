import { InteresaResponse } from "./interesa.interface";

export interface ViviendaListResponse {
    content:          Viviendas[];
    pageable:         Pageable;
    last:             boolean;
    totalPages:       number;
    totalElements:    number;
    size:             number;
    number:           number;
    sort:             Sort;
    first:            boolean;
    numberOfElements: number;
    empty:            boolean;
}

export interface Viviendas {
    id:                number;
    titulo:            string;
    precio:            number;
    tipo:              Tipo;
    descripcion:       Descripcion;
    direccion:         string;
    poblacion:         string;
    codigoPostal:      number;
    provincia:         string;
    estado:            Estado;
    metrosCuadrados:   number;
    numHabitaciones:   number;
    numBanyos:         number;
    avatarVivienda:    string;
    tienePiscina:      boolean;
    tieneAscensor:     boolean;
    tieneGaraje:       boolean;
    intereses:         number;
    emailPropietario:  string;
    interesados: InteresaResponse[];
    telefono: string;
    avatarPropietario: string;
    avatarInmobiliaria: string;
}

export enum Descripcion {
    DescripcionDeUnaVivienda = "descripcion de una vivienda",
}

export enum Estado {
    Compartir = "COMPARTIR",
    Compra = "COMPRA",
    NuevaObra = "NUEVA_OBRA",
}

export enum Tipo {
    Casa = "CASA",
    Piso = "PISO",
}

export interface Pageable {
    sort:       Sort;
    offset:     number;
    pageSize:   number;
    pageNumber: number;
    paged:      boolean;
    unpaged:    boolean;
}

export interface Sort {
    empty:    boolean;
    sorted:   boolean;
    unsorted: boolean;
}

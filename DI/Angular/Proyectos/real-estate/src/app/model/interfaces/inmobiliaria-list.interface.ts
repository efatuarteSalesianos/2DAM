import { Vivienda } from "./vivienda.interface";

export interface InmobiliariaListResponse {
    content:          Inmobiliaria[];
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

export interface Inmobiliaria {
    id:                number;
    avatar:         string;
    nombre:         string;
    email:          string;
    telefono:       string;
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

import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { PageEvent } from '@angular/material/paginator';
import { Viviendas } from 'src/app/model/interfaces/vivienda-list.interface';
import { ViviendaService } from 'src/app/services/vivienda.service';
interface ArraySelect {
  value: number;
  viewValue: number;
}

interface ArraySelectString {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-viviendas-list',
  templateUrl: './viviendas-list.component.html',
  styleUrls: ['./viviendas-list.component.css']
})
export class ViviendasListComponent implements OnInit {

  listaViviendas: Viviendas[] = [];
  pageNumber = 0;
  titulo: string = "";
  provincia: string = "";
  direccion: string = "";
  poblacion: string = "";
  codigoPostal: string = "";
  numBanyos: string = "";
  numHabitaciones: string = "";
  metrosCuadrados: string = "";
  precio: string = "";
  tienePiscina: string = "";
  tieneAscensor: string = "";
  tieneGaraje: string = "";
  estado: string ="";
  tipo: string = "";
  pageSize = 10;

  max = 100;
  min = 0;
  step = 1;
  value = 0;

  

  numSelected: ArraySelect[] = [
    {value: 1, viewValue: 1},
    {value: 2, viewValue: 2},
    {value: 3, viewValue: 3},
    {value: 4, viewValue: 4},
    {value: 5, viewValue: 5},
    {value: 6, viewValue: 6},
    {value: 7, viewValue: 7},
    {value: 8, viewValue: 8}
  ];
  
  estadoSelect = new FormControl();


  estadoV: ArraySelectString[] = [
    {value: "COMPRA", viewValue: "Compra"},
    {value: "ALQUILER", viewValue: "Alquiler"},
    {value: "COMPARTIR", viewValue: "Compartir"},
    {value: "NUEVA_OBRA", viewValue: "Nueva Obra"}
  ];

  tipoV: ArraySelectString[] = [
    {value: "CASA", viewValue: "Casa"},
    {value: "PISO", viewValue: "Piso"}
  ]

  constructor(private viviendaListService: ViviendaService) { }

  
  

  getViviendas() {
    this.viviendaListService.getViviendaList(this.pageNumber, this.titulo, this.provincia, this.direccion, this.poblacion, this.codigoPostal, this.numBanyos, this.numHabitaciones, this.metrosCuadrados, this.precio, this.tienePiscina, this.tieneAscensor, this.tieneGaraje, this.estado, this.tipo).subscribe(listaViviendaResponse => {
      this.listaViviendas = listaViviendaResponse.content;
    });
  }

  botonRegreso() {
    this.titulo = "";
    this.provincia = "";
    this.direccion = "";
    this.poblacion = "";
    this.codigoPostal = "";
    this.numBanyos = "";
    this.numHabitaciones = "";
    this.metrosCuadrados = "";
    this.precio = "";
    this.tienePiscina = "";
    this.tieneAscensor = "";
    this.tieneGaraje = "";
    this.estado = "";
    this.tipo = "";
    this.getViviendas();
  }

  filtrar() {
    this.getViviendas();
  }
  ngOnInit(): void {

   // this.getViviendas();
    console.log(this.getViviendas());
  }

  handlePage(event: PageEvent) {
    this.pageSize = event.pageSize;
    this.pageNumber = event.pageIndex;
  }


  dataSourse = this.listaViviendas;

  formatLabel(value: number) {
    if (value >= 1000) {
      return Math.round(value / 1000) + '€';
    }

    return value;
  }
}

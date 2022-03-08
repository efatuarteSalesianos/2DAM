import { Component, OnInit } from '@angular/core';
import { ViviendaService } from 'src/app/services/vivienda.service';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { Viviendas } from 'src/app/model/interfaces/vivienda-list.interface';

interface ArraySelectString {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  estado = 'COMPRA';
  estados = ['COMPRA','ALQUILER','OBRA_NUEVA','COMPARTIR'];

  

  tipoV: ArraySelectString[] = [
    {value: "CASA", viewValue: "Casa"},
    {value: "PISO", viewValue: "Piso"}
  ]

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
  tipo: string = "";
  
  constructor(private route: ActivatedRoute, private viviendaListService: ViviendaService) { }

  ngOnInit(): void {
    this.getViviendas();
    console.log(this.getViviendas());
  }

  selectTab($event: any) {
    this.estado = this.estados[$event.index];
    console.log(this.estado);
  }

  getViviendas() {
    this.viviendaListService.getViviendaList(this.pageNumber, this.titulo, this.provincia, this.direccion, this.poblacion, this.codigoPostal, this.numBanyos, this.numHabitaciones, this.metrosCuadrados, this.precio, this.tienePiscina, this.tieneAscensor, this.tieneGaraje, this.estado, this.tipo).subscribe(listaViviendaResponse => {
      this.listaViviendas = listaViviendaResponse.content;
    });
  }

  filtrar() {
    this.getViviendas();
  }
/*
  ngOnInit() {
    this.route.queryParams
      .subscribe(params => {
        console.log(params); // {"precio_min": <min>, "precio_max": <max>}
      });
  }*/
}

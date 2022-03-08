import { Component, OnInit } from '@angular/core';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';
import { ViviendaService } from 'src/app/services/vivienda.service';

@Component({
  selector: 'app-top-viviendas',
  templateUrl: './top-viviendas.component.html',
  styleUrls: ['./top-viviendas.component.css']
})
export class TopViviendasComponent implements OnInit {

  viviendasTopList: Vivienda[] | undefined

  constructor(private viviendaService: ViviendaService) { }

  ngOnInit(): void {
    this.getViviendasTopList();
  }

  getViviendasTopList() {
    this.viviendaService.getTopViviendas().subscribe(resultado => {
      this.viviendasTopList = resultado;
    })
  }

}

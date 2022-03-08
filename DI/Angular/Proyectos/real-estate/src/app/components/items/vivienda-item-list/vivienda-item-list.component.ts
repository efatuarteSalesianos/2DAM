import { Component, Input, OnInit } from '@angular/core';
import { Viviendas } from 'src/app/model/interfaces/vivienda-list.interface';
import { ViviendaService } from 'src/app/services/vivienda.service';

@Component({
  selector: 'app-vivienda-item-list',
  templateUrl: './vivienda-item-list.component.html',
  styleUrls: ['./vivienda-item-list.component.css']
})
export class ViviendaItemListComponent implements OnInit {

  @Input() viviendaInput!: Viviendas;

  constructor(private viviendaService: ViviendaService) { }

  ngOnInit(): void {
  }

}

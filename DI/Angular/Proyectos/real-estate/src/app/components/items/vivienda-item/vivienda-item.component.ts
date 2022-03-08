import { Component, Input, OnInit } from '@angular/core';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';

@Component({
  selector: 'app-vivienda-item',
  templateUrl: './vivienda-item.component.html',
  styleUrls: ['./vivienda-item.component.css']
})
export class ViviendaItemComponent implements OnInit {

  @Input() viviendaInput !: Vivienda;

  constructor() { }

  ngOnInit(): void {

  }

}

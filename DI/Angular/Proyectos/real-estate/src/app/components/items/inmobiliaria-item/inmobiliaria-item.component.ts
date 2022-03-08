import { Component, Input, OnInit } from '@angular/core';
import { InmobiliariaResponse } from '../../../model/interfaces/inmobiliaria.interface';

@Component({
  selector: 'app-inmobiliaria-item',
  templateUrl: './inmobiliaria-item.component.html',
  styleUrls: ['./inmobiliaria-item.component.css']
})
export class InmobiliariaItemComponent implements OnInit {

  @Input() inmobiliariaInput !: InmobiliariaResponse;

  constructor() { }

  ngOnInit(): void {
  }

}

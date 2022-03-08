import { Component, Input, OnInit } from '@angular/core';
import { PropietarioResponse } from '../../../model/interfaces/propietario.interface';

@Component({
  selector: 'app-propietario-item',
  templateUrl: './propietario-item.component.html',
  styleUrls: ['./propietario-item.component.css']
})
export class PropietarioItemComponent implements OnInit {

  @Input() propietarioInput !: PropietarioResponse;

  constructor() { }

  ngOnInit(): void {
  }

}

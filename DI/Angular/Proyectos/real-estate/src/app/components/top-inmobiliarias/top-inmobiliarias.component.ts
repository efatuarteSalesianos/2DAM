import { Component, OnInit } from '@angular/core';
import { InmobiliariaService } from '../../services/inmobiliaria.service';
import { InmobiliariaResponse } from 'src/app/model/interfaces/inmobiliaria.interface';

@Component({
  selector: 'app-top-inmobiliarias',
  templateUrl: './top-inmobiliarias.component.html',
  styleUrls: ['./top-inmobiliarias.component.css']
})
export class TopInmobiliariasComponent implements OnInit {

  inmobiliariasTopList: InmobiliariaResponse[] | undefined

  constructor(private inmobiliariaService: InmobiliariaService) { }

  ngOnInit(): void {
    this.getInmobiliariasTopList();
  }

  getInmobiliariasTopList() {
    this.inmobiliariaService.getTopInmobiliarias().subscribe(resultado => {
      this.inmobiliariasTopList = resultado;
    })
  }

}

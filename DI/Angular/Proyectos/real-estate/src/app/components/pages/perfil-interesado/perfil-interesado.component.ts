import { Component, OnInit } from '@angular/core';
import { InteresadoResponse } from 'src/app/model/interfaces/interesado.interface';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';
import { InteresadoService } from 'src/app/services/interesado.service';

@Component({
  selector: 'app-perfil-interesado',
  templateUrl: './perfil-interesado.component.html',
  styleUrls: ['./perfil-interesado.component.css']
})
export class PerfilInteresadoComponent implements OnInit {

  interesado !: InteresadoResponse;
  viviendasFavoritas: Vivienda[] | undefined;

  constructor(private interesadoService: InteresadoService) { }

  ngOnInit(): void {
    this.interesadoService.getInteresado(1).subscribe(result => {
      this.interesado = result;
    });
    console.log(this.interesado.nombre)
  }
}

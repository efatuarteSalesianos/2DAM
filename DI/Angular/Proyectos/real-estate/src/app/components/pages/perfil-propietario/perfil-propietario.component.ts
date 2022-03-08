import { PropietarioResponse } from './../../../model/interfaces/propietario.interface';
import { PropietarioService } from './../../../services/propietario.service';
import { Component, Input, OnInit } from '@angular/core';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-perfil-propietario',
  templateUrl: './perfil-propietario.component.html',
  styleUrls: ['./perfil-propietario.component.css']
})
export class PerfilPropietarioComponent implements OnInit {

  propietario !: PropietarioResponse;
  propietarioId!: number;
  viviendasPropietario: Vivienda[] | undefined;

  constructor(private propietarioService: PropietarioService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.propietarioId = params['id'];
      this.propietarioService.getPropietario(this.propietarioId).subscribe(result => {
        this.propietario = result;
        console.log(this.propietario);
      });
    });
  }

}

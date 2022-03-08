import { Inmobiliaria } from 'src/app/model/interfaces/inmobiliaria-list.interface';
import { Component, OnInit } from '@angular/core';
import { InmobiliariaResponse } from 'src/app/model/interfaces/inmobiliaria.interface';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';
import { InmobiliariaService } from 'src/app/services/inmobiliaria.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-inmobiliaria-detail',
  templateUrl: './inmobiliaria-detail.component.html',
  styleUrls: ['./inmobiliaria-detail.component.css']
})
export class InmobiliariaDetailComponent implements OnInit {

  inmobiliaria !: InmobiliariaResponse;
  viviendasInmobiliaria: Vivienda[] | undefined;
  inmobiliariaId!: number;

  constructor(private inmobiliariaService: InmobiliariaService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.inmobiliariaId = params['id'];
      this.inmobiliariaService.getInmobiliaria(this.inmobiliariaId).subscribe(result => {
        this.inmobiliaria = result;
        console.log(this.inmobiliaria);
      });
    });
  }

}


import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Inmobiliaria, InmobiliariaListResponse } from 'src/app/model/interfaces/inmobiliaria-list.interface';
import { InmobiliariaResponse } from 'src/app/model/interfaces/inmobiliaria.interface';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';
import { InmobiliariaService } from 'src/app/services/inmobiliaria.service';
import { ViviendaService } from 'src/app/services/vivienda.service';

@Component({
  selector: 'app-add-inmobiliaria',
  templateUrl: './add-inmobiliaria.component.html',
  styleUrls: ['./add-inmobiliaria.component.css']
})
export class AddInmobiliariaComponent implements OnInit {
  vivienda!: Vivienda;
  viviendaId!: number;
  inmoId!:number;
  inmobiliariaList:Inmobiliaria []= [];
  constructor( private inmobiliariaService:InmobiliariaService, private route: ActivatedRoute, private viviendaService:ViviendaService) { }

  ngOnInit(): void {
    this.inmobiliariaService.getInmobiliariaList(100).subscribe(inmobiliaria =>{
      this.inmobiliariaList = inmobiliaria.content;
    });
    this.route.params.subscribe(params => {
      this.viviendaId = params['id'];

      });
  }

    addInmobiliaria(){
      this.viviendaService.addInmobiliariaFromVivienda(this.viviendaId, this.inmoId).subscribe(result => {
        this.vivienda = result;
      });
    }




}

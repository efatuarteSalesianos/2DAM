import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute } from '@angular/router';
import { InteresaResponse } from 'src/app/model/interfaces/interesa.interface';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';
import { ViviendaService } from 'src/app/services/vivienda.service';
import { AddInmobiliariaComponent } from '../../dialogs/add-inmobiliaria/add-inmobiliaria.component';
import { DeleteViviendaDialogComponent } from '../../dialogs/delete-vivienda-dialog/delete-vivienda-dialog.component';
import { ListInteresadosDialogComponent } from '../../dialogs/list-interesados-dialog/list-interesados-dialog.component';

@Component({
  selector: 'app-vivienda-detail',
  templateUrl: './vivienda-detail.component.html',
  styleUrls: ['./vivienda-detail.component.css']
})
export class ViviendaDetailComponent implements OnInit {
  vivienda!: Vivienda;
  viviendaId!:number;
  @Input() interesa:InteresaResponse[]=[];

  constructor(private viviendaService:ViviendaService, private dialog:MatDialog, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.viviendaId = params ['id'];
      this.viviendaService.getVivienda(this.viviendaId).subscribe(vivienda => {
        this.vivienda = vivienda;
        this.interesa=vivienda.interesados;
        console.log(this.interesa + "hola");
    });
  });
}

  openDialogEliminarVivienda(id:number){
    this.dialog.open(DeleteViviendaDialogComponent, {
      height: '300px',
      width: '400px',
      data: {id: this.interesa}
    });
  }
  openDialogInteresados(){
    this.dialog.open(ListInteresadosDialogComponent, {
      height: '300px',
      width: '400px',

      data: {lista: this.vivienda.interesados }

    });
  }

  eliminarInmobiliaria(){
    this.viviendaService.deleteInmobiliariaFromVivienda(this.viviendaId, this.vivienda.inmobiliariaId).subscribe(vivienda => {
      this.vivienda = vivienda;
      });
  }

  AgregarInmobiliaria(){
    this.dialog.open(AddInmobiliariaComponent, {
      height: '150px',
      width: '300px',
    });

  }

}

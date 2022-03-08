import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { InmobiliariaResponse } from 'src/app/model/interfaces/inmobiliaria.interface';
import { InmobiliariaService } from 'src/app/services/inmobiliaria.service';

export interface InmobiliariaDeleteDialogData {
  id: number;
}

@Component({
  selector: 'app-delete-inmobiliaria-dialog',
  templateUrl: './delete-inmobiliaria-dialog.component.html',
  styleUrls: ['./delete-inmobiliaria-dialog.component.css']
})
export class DeleteInmobiliariaDialogComponent implements OnInit {
  inmobiliaria!:InmobiliariaResponse;
  texto="";
  comprobar ='Si quiero eliminar la inmobiliaria';
  b=false;

  constructor(@Inject(MAT_DIALOG_DATA) private data: InmobiliariaDeleteDialogData,
  private inmobiliariaService: InmobiliariaService, private snackBar: MatSnackBar) { }

  ngOnInit(): void {
  }

   delete(){
    this.inmobiliariaService.deleteInmobiliaria(this.data.id).subscribe(inmobiliaria => {
      this.inmobiliaria = inmobiliaria;
      this.snackBar.open('inmobiliaria eliminada correctamente', 'Aceptar');
    });
  }
  verificar(){
    if(this.texto === this.comprobar){
      this.b=true;
    } else {
      this.b=false;
    }
  }


}

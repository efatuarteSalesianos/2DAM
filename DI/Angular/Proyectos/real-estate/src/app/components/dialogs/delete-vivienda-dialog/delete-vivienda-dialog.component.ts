import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Vivienda } from 'src/app/model/interfaces/vivienda.interface';
import { ViviendaService } from 'src/app/services/vivienda.service';

export interface ViviendaDeleteDialogData {
  id: number;
}

@Component({
  selector: 'app-delete-vivienda-dialog',
  templateUrl: './delete-vivienda-dialog.component.html',
  styleUrls: ['./delete-vivienda-dialog.component.css']
})
export class DeleteViviendaDialogComponent implements OnInit {
  vivienda!: Vivienda;
  texto="";
  comprobar ='Si quiero eliminar la vivienda';
  b=false;

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: ViviendaDeleteDialogData,
    private viviendaService: ViviendaService, private snackBar: MatSnackBar) { }

  ngOnInit(): void {
  }

  delete(){
    this.viviendaService.deleteVivienda(this.data.id).subscribe(vivienda => {
      this.vivienda = vivienda
      this.snackBar.open('vivienda eliminada correctamente', 'Aceptar');
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

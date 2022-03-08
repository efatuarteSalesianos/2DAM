import { Component, Inject, OnInit } from '@angular/core';
import { PropietarioResponse } from 'src/app/model/interfaces/propietario.interface';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { PropietarioService } from 'src/app/services/propietario.service';
import { MatSnackBar } from '@angular/material/snack-bar';

export interface PropietarioDeleteDialogData{
  id: number;
}

@Component({
  selector: 'app-delete-perfil-dialog',
  templateUrl: './delete-perfil-dialog.component.html',
  styleUrls: ['./delete-perfil-dialog.component.css']
})
export class DeletePerfilDialogComponent implements OnInit {
  propietario!: PropietarioResponse;
  texto="";
  comprobacion = "Entiendo las consecuencias, eliminar perfil";
  b=false;

  constructor(@Inject(MAT_DIALOG_DATA) private data: PropietarioDeleteDialogData, private propieratioService: PropietarioService, private snackBar: MatSnackBar) { }

  ngOnInit(): void {
  }

  delete(){
    this.propieratioService.deletePropietario(this.data.id).subscribe(propietario => {
      this.propietario = propietario;
      this.snackBar.open("Se eliminó correctamente el usuario", "Aceptar");
    })
  }

  verificar(){
    if(this.texto === this.comprobacion){
      this.b=true;
    }else {
      this.b = false;
    }
  }

}

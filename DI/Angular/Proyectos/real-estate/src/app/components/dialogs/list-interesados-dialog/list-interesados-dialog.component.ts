import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { InteresaResponse } from 'src/app/model/interfaces/interesa.interface';
import { PropietarioResponse } from 'src/app/model/interfaces/propietario.interface';
import { PropietarioService } from 'src/app/services/propietario.service';

export interface InteresadoDialogData{
  lista: InteresaResponse[];
}

@Component({
  selector: 'app-list-interesados-dialog',
  templateUrl: './list-interesados-dialog.component.html',
  styleUrls: ['./list-interesados-dialog.component.css']
})
export class ListInteresadosDialogComponent implements OnInit {
  lista=this.data.lista;
  propietarios: PropietarioResponse[]=new Array;
  constructor(@Inject(MAT_DIALOG_DATA) private data: InteresadoDialogData, private propietarioService: PropietarioService) { }

  ngOnInit(): void {
    for(let interes of this.lista){
      this.propietarioService.getPropietario(interes.propietarioId).subscribe(p => {
        this.propietarios.push(p);
      })
    }

  }

}

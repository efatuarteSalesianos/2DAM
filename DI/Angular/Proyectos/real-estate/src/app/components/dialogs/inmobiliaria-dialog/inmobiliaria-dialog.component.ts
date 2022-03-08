import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { InmobiliariaDTO } from 'src/app/model/dto/inmobiliaria.dto';
import { InmobiliariaService } from 'src/app/services/inmobiliaria.service';

@Component({
  selector: 'app-inmobiliaria-dialog',
  templateUrl: './inmobiliaria-dialog.component.html',
  styleUrls: ['./inmobiliaria-dialog.component.css']
})
export class InmobiliariaDialogComponent implements OnInit {

  inmobiliariaDto = new InmobiliariaDTO();

  constructor(private inmobiliariaService: InmobiliariaService, private snackBar: MatSnackBar) { }

  ngOnInit(): void {
  }

  crear() {
    if(this.inmobiliariaDto.nombre===""){
      this.snackBar.open('Faltan datos de la inmobiliaria', 'Aceptar');
    }else{
    this.inmobiliariaService.addInmobiliaria(this.inmobiliariaDto).subscribe(result => {
      this.inmobiliariaDto = result;
      this.snackBar.open('se ha creado la inmobiliaria correctamente', 'Aceptar');
      history.go(0)
    });
  }
  }

}

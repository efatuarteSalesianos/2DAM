import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { PropietarioDTO } from 'src/app/model/dto/propietario.dto';
import { PropietarioService } from 'src/app/services/propietario.service';

@Component({
  selector: 'app-propietario-dialog',
  templateUrl: './propietario-dialog.component.html',
  styleUrls: ['./propietario-dialog.component.css']
})
export class PropietarioDialogComponent implements OnInit {

  propietarioDto = new PropietarioDTO();
  constructor(private propietarioService: PropietarioService, private snackBar: MatSnackBar) { }

  ngOnInit(): void {
  }

  crear() {
    if(this.propietarioDto.nombre===""||this.propietarioDto.email===""||
      this.propietarioDto.apellidos===""||this.propietarioDto.direccion===""
      ||this.propietarioDto.telefono===""){
      this.snackBar.open('Faltan datos del propietario', 'Aceptar');
    }else{
      this.propietarioService.addPropietario(this.propietarioDto).subscribe(result => {
        this.propietarioDto = result;
        this.snackBar.open('se ha creado el propietario correctamente', 'Aceptar');
        history.go(0)
      });
    }
  }
}

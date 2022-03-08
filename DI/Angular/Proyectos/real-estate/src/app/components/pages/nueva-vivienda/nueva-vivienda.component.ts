import { Component, OnInit } from '@angular/core';
import { ViviendaService } from 'src/app/services/vivienda.service';
import { ViviendaNuevaDto } from 'src/app/model/dto/vivienda.dto';
import { MatDialog } from '@angular/material/dialog';
import { InmobiliariaDialogComponent } from '../../dialogs/inmobiliaria-dialog/inmobiliaria-dialog.component';
import { PropietarioDialogComponent } from '../../dialogs/propietario-dialog/propietario-dialog.component';
import { PropietarioService } from 'src/app/services/propietario.service';
import { PropietarioListResponse, Propietarios } from 'src/app/model/interfaces/propietario-list.interface';
import { PropietarioResponse } from 'src/app/model/interfaces/propietario.interface';
import { InmobiliariaService } from 'src/app/services/inmobiliaria.service';
import { Inmobiliaria } from 'src/app/model/interfaces/inmobiliaria-list.interface';
import { InmobiliariaResponse } from 'src/app/model/interfaces/inmobiliaria.interface';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-nueva-vivienda',
  templateUrl: './nueva-vivienda.component.html',
  styleUrls: ['./nueva-vivienda.component.css']
})
export class NuevaViviendaComponent implements OnInit {
  vivienda: ViviendaNuevaDto = new ViviendaNuevaDto;
  propietarios:Propietarios[] = [];
  inmobiliarias:Inmobiliaria[] = [];
  propietarioSelected!:PropietarioResponse;
  inmobiliariaSelected!:InmobiliariaResponse;
  constructor(private viviendaService: ViviendaService, private dialog:MatDialog,
    private propietarioService: PropietarioService, private inmobiliariaService: InmobiliariaService,
    private snackBar: MatSnackBar) { }

  ngOnInit(): void {
    this.propietarioService.getPropietarioList(100).subscribe(listaPropietariosResponse => {
      this.propietarios = listaPropietariosResponse.content;});

     this.inmobiliariaService.getInmobiliariaList(100).subscribe(listaInmobiliariasResponse => {
      this.inmobiliarias = listaInmobiliariasResponse.content;});

  }

  createVivienda() : void {
    this.viviendaService.postVivienda(this.vivienda).subscribe( m => {
      this.snackBar.open('vivienda creada correctamente', 'Aceptar');});
  }
  openDialogInmobiliaria() {
    this.dialog.open(InmobiliariaDialogComponent, {
      height: '800px',
      width: '600px',

    });
  }
  openDialogPropietario() {
    this.dialog.open(PropietarioDialogComponent, {
      height: '700px',
      width: '300px',

    });
  }
}

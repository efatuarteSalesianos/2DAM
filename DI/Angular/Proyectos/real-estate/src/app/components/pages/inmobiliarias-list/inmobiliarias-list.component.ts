import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { InmobiliariaResponse } from 'src/app/model/interfaces/inmobiliaria.interface';
import { DeleteInmobiliariaDialogComponent } from '../../dialogs/delete-inmobiliaria-dialog/delete-inmobiliaria-dialog.component';
import { Inmobiliaria } from 'src/app/model/interfaces/inmobiliaria-list.interface';
import { InmobiliariaService } from 'src/app/services/inmobiliaria.service';
import { MatTableDataSource } from '@angular/material/table';
import { MatMenuTrigger } from '@angular/material/menu';
import { MatPaginator } from '@angular/material/paginator';
import { InmobiliariaDialogComponent } from '../../dialogs/inmobiliaria-dialog/inmobiliaria-dialog.component';


@Component({
  selector: 'app-inmobiliarias-list',
  templateUrl: './inmobiliarias-list.component.html',
  styleUrls: ['./inmobiliarias-list.component.css']
})
export class InmobiliariasListComponent implements OnInit {

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('menuTrigger') menuTrigger!: MatMenuTrigger;
  @Input() data: Inmobiliaria[] = [];
  constructor(private inmobiliariaService: InmobiliariaService, private dialog:MatDialog) { }


  ngOnInit(): void {
    this.inmobiliariaService.getInmobiliariaList(0).subscribe(listaInmobiliariasResponse => {
      this.data = listaInmobiliariasResponse.content;
    });
  }

  openDialogEliminarInmobiliaria(id:number){
    this.dialog.open(DeleteInmobiliariaDialogComponent, {
      height: '300px',
      width: '400px',
      data: {id}
    });
    console.log(id);
  }
  openDialogAgregarInmobiliaria(){
      this.dialog.open(InmobiliariaDialogComponent, {
        height: '450px',
        width: '400px',
      });
  }


  displayedColumns: string[] = ['id', 'avatar', 'nombre', 'email', 'telefono', 'more'];
  dataSource = new MatTableDataSource(this.data);

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }
}

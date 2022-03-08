import { Component, Input, OnInit } from '@angular/core';
import {AfterViewInit, ViewChild} from '@angular/core';
import { MatMenuTrigger } from '@angular/material/menu';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';
import { Propietarios } from 'src/app/model/interfaces/propietario-list.interface';
import { PropietarioService } from 'src/app/services/propietario.service';
import { DeletePerfilDialogComponent } from '../../dialogs/delete-perfil-dialog/delete-perfil-dialog.component';
import { MatDialog } from '@angular/material/dialog';


@Component({
  selector: 'app-propietarios-list',
  templateUrl: './propietarios-list.component.html',
  styleUrls: ['./propietarios-list.component.css']
})
export class PropietariosListComponent implements OnInit {
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('menuTrigger') menuTrigger!: MatMenuTrigger;
  @Input() data: Propietarios[] = [];
  constructor(private propietarioService: PropietarioService, private dialog:MatDialog) { }


    ngOnInit(): void {

      this.propietarioService.getPropietarioList(0).subscribe(listaPropietariosResponse => {
        this.data = listaPropietariosResponse.content;
      });

    }

    openDialogEliminarPropietario(id: number){
      this.dialog.open(DeletePerfilDialogComponent, {
        height: '300px',
      width: '500px',
      data: {id}
      });

      console.log(id);
    }
    

      displayedColumns: string[] = ['id', 'avatar', 'nombre', 'apellidos', 'direccion', 'email', 'telefono', 'more'];
      dataSource = new MatTableDataSource(this.data);
    
      applyFilter(event: Event) {
        const filterValue = (event.target as HTMLInputElement).value;
        this.dataSource.filter = filterValue.trim().toLowerCase();
      }

      ngAfterViewInit() {
        this.dataSource.paginator = this.paginator;
      }
  
      
      
}

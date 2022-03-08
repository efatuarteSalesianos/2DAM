import { Component, OnInit, ViewChild } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { FormBuilder, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})

export class TableComponent implements OnInit {

  columnas: FormGroup;

  displayedOriginalColumns: string[] = ['ID', 'Nombre', 'Apellido', 'Edad', 'Altura', 'Acciones'];
  displayedColumns: string[] = ['ID', 'Nombre', 'Apellido', 'Edad', 'Altura', 'Acciones'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);

  constructor(fb: FormBuilder) {
    this.columnas = fb.group({
      id: false,
      nombre: false,
      apellido: false,
      edad: false,
      altura: false
    });
  }

  @ViewChild (MatSort, {static:true}) sort=null;

  ngOnInit(): void {
    this.dataSource.sort = this.sort;
  }

  mostrarColumnas(isChecked: boolean, columna: string) {
    if (isChecked) {
      // Si marcamos la columna, la añadimos a la tabla
      let i = this.displayedOriginalColumns.indexOf(columna);
      console.log("Indice de la columna " + columna + " en el array original: " + i);
      // Comprobamos si el índice de la columna que quiero añadir en el array original es mayor
      // que el índice del elemento k en el array original. Si esto se cumple, debe añadir el elemento en esa posición.
      // EJ: ['Nombre', 'Acciones'] -> Columnas Mostradas
      // Quiero añadir la columna Edad -> Indice 3 en el array original
      // Lo comparo con el indice de Nombre (Indice 1) y al ser mayor hacemos k++
      // Al llegar a Acciones (Indice 5) es menor el indice de Edad, por lo que lo coloca antes

      this.displayedColumns.forEach(element => {
        console.log([element]);
      });

      // Si la tabla está vacía hago un push del elemento
      if(this.displayedColumns.length == 0) {
        this.displayedColumns.push(columna);
      }
      for(let k = 0; k < this.displayedColumns.length; k++) {
        if(i < this.displayedOriginalColumns.indexOf(this.displayedColumns[k])) {
          this.displayedColumns.splice(k, 0, columna);
          break;
        }
        else {
          this.displayedColumns.push(columna);
        }
      }

      console.log("Columna 0 del array de columnas mostradas: " + this.displayedColumns[0]);
      console.log("Indice de este elemento en el array original: " + this.displayedOriginalColumns.indexOf(this.displayedColumns[0]));
      this.displayedColumns.forEach(element => {
        console.log([element]);
      });
    }
    else {
      // Aqui borramos la columna que desmarcamos
      this.displayedColumns.splice(this.displayedColumns.indexOf(columna), 1);
    }
  }

}
export interface Alumnos {
  id: number;
  nombre: string;
  apellido: string;
  edad: number;
  altura: number;
}

const ELEMENT_DATA: Alumnos[] = [
  {id: 1, nombre: 'Ernesto', apellido: 'Fatuarte', edad: 26, altura: 175},
  {id: 2, nombre: 'Mariluz', apellido: 'Gil', edad: 25, altura: 163},
  {id: 3, nombre: 'Sergio', apellido: 'Chamorro', edad: 20, altura: 178},
  {id: 4, nombre: 'Inma', apellido: 'Domínguz', edad: 19, altura: 171},
  {id: 5, nombre: 'Pablo', apellido: 'Repiso', edad: 28, altura: 168},
  {id: 6, nombre: 'Richard', apellido: 'Céspedes', edad: 23, altura: 159},
  {id: 7, nombre: 'Manuel', apellido: 'Naval', edad: 31, altura: 173},
  {id: 8, nombre: 'Cynthia', apellido: 'Labrador', edad: 22, altura: 179},
  {id: 9, nombre: 'Juan Carlos', apellido: 'Ardana', edad: 17, altura: 182},
  {id: 10, nombre: 'Miguel', apellido: 'Campos', edad: 42, altura: 179},
];


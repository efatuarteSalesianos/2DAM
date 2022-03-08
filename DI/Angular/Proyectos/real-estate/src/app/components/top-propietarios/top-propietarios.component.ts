import { Component, OnInit } from '@angular/core';
import { PropietarioResponse } from '../../model/interfaces/propietario.interface';
import { PropietarioService } from '../../services/propietario.service';

@Component({
  selector: 'app-top-propietarios',
  templateUrl: './top-propietarios.component.html',
  styleUrls: ['./top-propietarios.component.css']
})
export class TopPropietariosComponent implements OnInit {

  propietariosTopList: PropietarioResponse[] | undefined

  constructor(private propietarioService: PropietarioService) { }

  ngOnInit(): void {
    this.getPropietariosTopList();
  }

  getPropietariosTopList() {
    this.propietarioService.getTopPropietarios().subscribe(resultado => {
      this.propietariosTopList = resultado;
    })
  }

}

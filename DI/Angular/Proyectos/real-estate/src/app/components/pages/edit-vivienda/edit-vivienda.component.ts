import { Component, OnInit } from '@angular/core';
import { ViviendaService } from 'src/app/services/vivienda.service';
import { Vivienda } from '../../../model/interfaces/vivienda.interface';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-edit-vivienda',
  templateUrl: './edit-vivienda.component.html',
  styleUrls: ['./edit-vivienda.component.css']
})
export class EditViviendaComponent implements OnInit {

  vivienda!: Vivienda;
  viviendaId!: number;
  constructor(private viviendaService: ViviendaService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.viviendaId = params['id'];
      this.viviendaService.getVivienda(this.viviendaId).subscribe(result => {
        this.vivienda = result;
      });
    });
  }

  editVivienda() {
    this.viviendaService.editarVivienda(this.vivienda).subscribe()
  }

}

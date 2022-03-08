import { Component, OnInit } from '@angular/core';
import { InteresaConInteresadoDTO } from '../../../model/dto/interesa-interesado.dto';
import { ViviendaService } from '../../../services/vivienda.service';
import { ActivatedRoute } from '@angular/router';
import { Vivienda } from '../../../model/interfaces/vivienda.interface';

@Component({
  selector: 'app-nuevo-interesado',
  templateUrl: './nuevo-interesado.component.html',
  styleUrls: ['./nuevo-interesado.component.css']
})
export class NuevoInteresadoComponent implements OnInit {

  vivienda !: Vivienda;
  viviendaId !: number;
  interesaDTO = new InteresaConInteresadoDTO();

  constructor(private viviendaService: ViviendaService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.viviendaId = params['id'];
      this.viviendaService.getVivienda(this.viviendaId).subscribe(result => {
        this.vivienda = result;
      });
    });
  }

  createInteresa() {
    this.viviendaService.createInteresaAndInteresado(this.vivienda.id, this.interesaDTO).subscribe();
  }

}

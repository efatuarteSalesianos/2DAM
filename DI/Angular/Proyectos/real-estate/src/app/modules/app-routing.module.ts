import { HomeComponent } from './../components/pages/home/home.component';
import { InmobiliariaDialogComponent } from './../components/dialogs/inmobiliaria-dialog/inmobiliaria-dialog.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PageNotFoundComponent } from '../components/pages/page-not-found/page-not-found.component';
import { PerfilPropietarioComponent } from '../components/pages/perfil-propietario/perfil-propietario.component';
import { InmobiliariaDetailComponent } from '../components/pages/inmobiliaria-detail/inmobiliaria-detail.component';
import { NuevaViviendaComponent } from '../components/pages/nueva-vivienda/nueva-vivienda.component';
import { ViviendaDetailComponent } from '../components/pages/vivienda-detail/vivienda-detail.component';
import { ViviendasListComponent } from '../components/pages/viviendas-list/viviendas-list.component';
import { PropietariosListComponent } from '../components/pages/propietarios-list/propietarios-list.component';
import { InmobiliariasListComponent } from '../components/pages/inmobiliarias-list/inmobiliarias-list.component';
import { PerfilInteresadoComponent } from '../components/pages/perfil-interesado/perfil-interesado.component';
import { EditViviendaComponent } from '../components/pages/edit-vivienda/edit-vivienda.component';
import { NuevoInteresadoComponent } from '../components/pages/nuevo-interesado/nuevo-interesado.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent},
  { path: 'vivienda/:id', component: ViviendaDetailComponent},
  { path: 'vivienda/editar/:id', component: EditViviendaComponent},
  { path: 'nueva/vivienda', component: NuevaViviendaComponent},
  { path: 'propietario/:id', component:  PerfilPropietarioComponent},
  { path: 'interesado/:id', component:  PerfilInteresadoComponent},
  { path: 'inmobiliaria/:id', component: InmobiliariaDetailComponent},
  { path: 'viviendas', component: ViviendasListComponent},
  { path: 'propietarios', component: PropietariosListComponent},
  { path: 'inmobiliarias', component: InmobiliariasListComponent},
  { path: 'vivienda/:id/meinteresa', component: NuevoInteresadoComponent},
  { path: '',   redirectTo: '/home', pathMatch: 'full' },
  { path: '**', component: PageNotFoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

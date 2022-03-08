import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './modules/app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MaterialImportsModule } from './modules/material-imports.module';

import { HttpClientModule } from '@angular/common/http';

import { FormsModule } from '@angular/forms';
import { ToolbarComponent } from './components/shared/toolbar/toolbar.component';
import { PerfilPropietarioComponent } from './components/pages/perfil-propietario/perfil-propietario.component';
import { PageNotFoundComponent } from './components/pages/page-not-found/page-not-found.component';
import { InmobiliariaDialogComponent } from './components/dialogs/inmobiliaria-dialog/inmobiliaria-dialog.component';
import { InmobiliariaDetailComponent } from './components/pages/inmobiliaria-detail/inmobiliaria-detail.component';
import { PerfilInteresadoComponent } from './components/pages/perfil-interesado/perfil-interesado.component';
import { NuevaViviendaComponent } from './components/pages/nueva-vivienda/nueva-vivienda.component';
import { InmobiliariasListComponent } from './components/pages/inmobiliarias-list/inmobiliarias-list.component';
import { PropietariosListComponent } from './components/pages/propietarios-list/propietarios-list.component';
import { HomeComponent } from './components/pages/home/home.component';
import { ViviendasListComponent } from './components/pages/viviendas-list/viviendas-list.component';
import { InmobiliariaItemComponent } from './components/items/inmobiliaria-item/inmobiliaria-item.component';
import { ViviendaItemListComponent } from './components/items/vivienda-item-list/vivienda-item-list.component';
import { PropietarioItemComponent } from './components/items/propietario-item/propietario-item.component'
import { TopViviendasComponent } from './components/top-viviendas/top-viviendas.component';
import { TopInmobiliariasComponent } from './components/top-inmobiliarias/top-inmobiliarias.component';
import { TopPropietariosComponent } from './components/top-propietarios/top-propietarios.component';
import { DeleteViviendaDialogComponent } from './components/dialogs/delete-vivienda-dialog/delete-vivienda-dialog.component';
import { DeletePerfilDialogComponent } from './components/dialogs/delete-perfil-dialog/delete-perfil-dialog.component';
import { ListInteresadosDialogComponent } from './components/dialogs/list-interesados-dialog/list-interesados-dialog.component';
import { SelectImageInmobiliariaDialogComponent } from './components/dialogs/select-image-inmobiliaria-dialog/select-image-inmobiliaria-dialog.component';
import { SelectImageViviendaDialogComponent } from './components/dialogs/select-image-vivienda-dialog/select-image-vivienda-dialog.component';
import { SelectImagePersonaDialogComponent } from './components/dialogs/select-image-persona-dialog/select-image-persona-dialog.component';
import { PropietarioDialogComponent } from './components/dialogs/propietario-dialog/propietario-dialog.component';
import { ViviendaDetailComponent } from './components/pages/vivienda-detail/vivienda-detail.component';
import { ViviendaItemComponent } from './components/items/vivienda-item/vivienda-item.component';
import { DeleteInmobiliariaDialogComponent } from './components/dialogs/delete-inmobiliaria-dialog/delete-inmobiliaria-dialog.component';
import { EditViviendaComponent } from './components/pages/edit-vivienda/edit-vivienda.component';
import { MeInteresaDialogComponent } from './components/dialogs/me-interesa-dialog/me-interesa-dialog.component';
import { NuevoInteresadoComponent } from './components/pages/nuevo-interesado/nuevo-interesado.component';
import { AddInmobiliariaComponent } from './components/dialogs/add-inmobiliaria/add-inmobiliaria.component';




@NgModule({
  declarations: [
    AppComponent,
    ToolbarComponent,
    PerfilPropietarioComponent,
    PageNotFoundComponent,
    InmobiliariaDialogComponent,
    InmobiliariaDetailComponent,
    PerfilInteresadoComponent,
    NuevaViviendaComponent,
    InmobiliariasListComponent,
    PropietariosListComponent,
    HomeComponent,
    ViviendasListComponent,
    InmobiliariaItemComponent,
    ViviendaItemListComponent,
    PropietarioItemComponent,
    TopViviendasComponent,
    TopInmobiliariasComponent,
    TopPropietariosComponent,
    DeleteViviendaDialogComponent,
    DeletePerfilDialogComponent,
    ListInteresadosDialogComponent,
    SelectImageInmobiliariaDialogComponent,
    SelectImageViviendaDialogComponent,
    SelectImagePersonaDialogComponent,
    PropietarioDialogComponent,
    ViviendaDetailComponent,
    ViviendaItemComponent,
    DeleteInmobiliariaDialogComponent,
    EditViviendaComponent,
    MeInteresaDialogComponent,
    NuevoInteresadoComponent,
    AddInmobiliariaComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { MovieListComponent } from './../movie-list/movie-list.component';
import { PageNotFoundComponent } from './../page-not-found/page-not-found.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: 'movies-popular', component: MovieListComponent },
  { path: '',   redirectTo: '/movies-popular', pathMatch: 'full' },
  { path: '**', component: PageNotFoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

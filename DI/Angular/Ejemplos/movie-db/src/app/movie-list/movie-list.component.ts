import { MovieService } from './../services/movie.service';
import { Movie } from './../model/interfaces/movie.interface';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-movie-list',
  templateUrl: './movie-list.component.html',
  styleUrls: ['./movie-list.component.css']
})
export class MovieListComponent implements OnInit {

  moviesPopularList: Movie[] | undefined;

  constructor(private MovieService: MovieService) { }

  ngOnInit(): void {
    this.getMoviesPopularList();
  }

  getMoviesPopularList() {
    this.MovieService.getPopularMovies().subscribe(resultado => {
      this.moviesPopularList = resultado.results;
      console.log(this.moviesPopularList)
    })
  }

}

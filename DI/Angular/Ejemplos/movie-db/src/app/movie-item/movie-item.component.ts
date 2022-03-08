import { Movie } from './../model/interfaces/movie.interface';
import { Component, Input, OnInit } from '@angular/core';
@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent implements OnInit {

  @Input() movieInput: Movie | undefined;

  constructor() { }

  ngOnInit(): void {
  }

  getPhotoUrl(url: string | undefined): string {
    if(url) {
      let photo = this.movieInput?.backdrop_path;
      return `https://www.themoviedb.org/t/p/w220_and_h330_face${photo}`;
    } else {
      return '';
    }
  }

}

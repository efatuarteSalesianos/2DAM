import { environment } from './../../environments/environment.prod';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { PostResponse } from '../models/interfaces/post.interface';

@Injectable({
  providedIn: 'root'
})
export class PostService {

  constructor(private http: HttpClient) { }

  listarPosts() {
    let requestUrl = `${environment.API_BASE_URL}/post/public`;
    return this.http.get<PostResponse>(requestUrl, )
  }
}

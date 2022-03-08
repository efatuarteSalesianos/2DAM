import { environment } from './../../environments/environment.prod';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TweetResponse } from '../models/interfaces/tweet.interface';

@Injectable({
  providedIn: 'root'
})
export class PrincipalService {

  constructor(private http: HttpClient) { }

  listarTweets() {
    let requestUrl = `${environment.API_BASE_URL}tweets/all`;
    return this.http.get<TweetResponse>(requestUrl, )
  }
}

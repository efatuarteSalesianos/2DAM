import { RegisterResponse } from './../models/interfaces/register.interface';
import { environment } from './../../environments/environment';
import { SignupDTO } from './../models/dto/signup.dto';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }

  register(registerDto: SignupDTO): Observable<RegisterResponse> {
    let requestUrl: string = `${environment.API_BASE_URL}auth/signup`;
    return this.http.post<RegisterResponse>(requestUrl, registerDto, DEFAULT_HEADERS);
  }
}

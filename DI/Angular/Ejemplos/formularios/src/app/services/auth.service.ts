import { AuthRegisterDTO, AuthLoginDTO } from './../model/dto/auth.dto';
import { AuthRegisterResponse, AuthLoginResponse } from './../model/interfaces/auth.interface';
import { environment } from './../../environments/environment.prod';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const AUTH_BASE_URL = 'auth';
const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  authBaseUrl = `${environment.apiBaseUrl}/${AUTH_BASE_URL}`;

  constructor(private http: HttpClient) { }

  login(loginDTO: AuthLoginDTO): Observable<AuthLoginResponse> {
    let requestUrl = `${this.authBaseUrl}/login`;
    return this.http.post<AuthLoginResponse>(requestUrl, loginDTO, DEFAULT_HEADERS);

  }

  register(registerDTO: AuthRegisterDTO): Observable<AuthRegisterResponse> {
    let requestUrl = `${this.authBaseUrl}/signup`;
    return this.http.post<AuthRegisterResponse>(requestUrl, registerDTO, DEFAULT_HEADERS);
  }
}

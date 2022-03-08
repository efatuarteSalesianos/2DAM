import { AuthLoginDTO } from './../model/dto/auth.dto';
import { AuthService } from './../services/auth.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.css']
})
export class LoginPageComponent implements OnInit {

  loginDTO = new AuthLoginDTO();

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
  }

  spam: string[] = ['admin@admin.com'];
  hide = true;

  login() {

    if(this.spam.includes(this.loginDTO.email))
      console.log("Correo prohibido!!");
    console.log("DATOS DE LOGIN");
    console.log("Correo Electrónico: " + this.loginDTO.email);
    console.log("Contraseña: " + this.loginDTO.password);

    this.authService.login(this.loginDTO).subscribe(response => {
      alert(`Has iniciado sesión correctamente! Tu token es: ${response.token}`);
    });
  }

}

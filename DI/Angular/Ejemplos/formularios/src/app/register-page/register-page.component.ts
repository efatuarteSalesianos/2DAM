import { AuthRegisterDTO } from './../model/dto/auth.dto';
import { Component, OnInit } from '@angular/core';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-register-page',
  templateUrl: './register-page.component.html',
  styleUrls: ['./register-page.component.css']
})
export class RegisterPageComponent implements OnInit {

  registerDTO = new AuthRegisterDTO();

  numeros="0123456789";
  letras_minusculas="abcdefghyjklmnñopqrstuvwxyz";
  letras_mayusculas="ABCDEFGHYJKLMNÑOPQRSTUVWXYZ";
  caracteres="!#$%&'()*+,-./:;<=>?@[\]^_`{|}~";

  tiene_numeros(pass: string){
    for(let i=0; i<pass.length; i++){
       if (this.numeros.indexOf(pass.charAt(i),0)!=-1){
          return 1;
       }
    }
    return 0;
  }

  tiene_minusculas(pass: string){
    for(let i=0; i<pass.length; i++){
       if (this.letras_minusculas.indexOf(pass.charAt(i),0)!=-1){
          return 1;
       }
    }
    return 0;
  }

  tiene_mayusculas(pass: string){
    for(let i=0; i<pass.length; i++){
       if (this.letras_mayusculas.indexOf(pass.charAt(i),0)!=-1){
          return 1;
       }
    }
    return 0;
  }

  tiene_caracteres(pass: string){
    for(let i=0; i<pass.length; i++){
       if (this.caracteres.indexOf(pass.charAt(i),0)!=-1){
          return 1;
       }
    }
    return 0;
  }

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
  }

  spam: string[] = ['admin@admin.com'];
  repitPassword = '';
  hide = true;

  register() {

    if(this.spam.includes(this.registerDTO.email))
      console.log("Correo prohibido!!");
    else if(this.tiene_numeros(this.registerDTO.password)==0 || this.tiene_minusculas(this.registerDTO.password)==0 || this.tiene_mayusculas(this.registerDTO.password)==0 || this.tiene_caracteres(this.registerDTO.password)==0)
      console.log("La contraseña no es válida")
    else if(this.registerDTO.password != this.repitPassword)
      console.log("La confirmación de contraseña ha sido errónea");
    console.log("DATOS DE REGISTRO");
    console.log("Usuario: " + this.registerDTO.username);
    console.log("Correo Electrónico: " + this.registerDTO.email);
    console.log("Contraseña: " + this.registerDTO.password);
    console.log("Contraseña Repetida: " + this.repitPassword);

    this.authService.register(this.registerDTO).subscribe(response => {
      alert(`Te has registrado correctamente! Tu token es: ${response.token}`)
    })
  }

}

import { AuthService } from './../../services/auth.service';
import { SignupDTO } from './../../models/dto/signup.dto';
import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Validators } from '@angular/forms';

@Component({
  selector: 'app-register-form',
  templateUrl: './register-form.component.html',
  styleUrls: ['./register-form.component.css']
})
export class RegisterFormComponent implements OnInit {

  registerForm!: FormGroup;
  registerDto = new SignupDTO();

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
    this.registerForm = new FormGroup({
      username: new FormControl('', [Validators.required, Validators.minLength(6), Validators.maxLength(20)]),
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required, Validators.minLength(6), Validators.maxLength(40)])
    })
  }

  register() {
    this.registerDto.username = this.registerForm.get('username')?.value;
    this.registerDto.email = this.registerForm.get('email')?.value;
    this.registerDto.password = this.registerForm.get('password')?.value;
    this.authService.register(this.registerDto).subscribe(res => {
      localStorage.setItem('token', res.token);
      console.log(res.token);
    });
  }

}

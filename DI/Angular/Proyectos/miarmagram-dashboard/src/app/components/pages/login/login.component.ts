import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { LoginDTO } from 'src/app/models/dto/login.dto';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm!: FormGroup;
  loginDto = new LoginDTO();

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
    this.loginForm = new FormGroup({
      username: new FormControl('', [Validators.required]),
      password: new FormControl('', [Validators.required])
    })
  }

  public showPassword: boolean = false;

  public togglePasswordVisibility(): void {
    this.showPassword = !this.showPassword;
  }

  login() {
    const hide = true;
    this.loginDto.username = this.loginForm.get('username')?.value;
    this.loginDto.password = this.loginForm.get('password')?.value;
    this.authService.login(this.loginDto).subscribe(res => {
      localStorage.setItem('token', res.token);
      console.log(res.token);
      this.router.navigate(['/home']);
    });
  }

}

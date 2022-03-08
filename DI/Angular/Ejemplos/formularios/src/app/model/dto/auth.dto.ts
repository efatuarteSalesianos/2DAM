export class AuthLoginDTO {

  email: string;
  password: string;

  constructor() {
    this.email = '';
    this.password = '';
  }
}

export class AuthRegisterDTO {

  username: string;
  email: string;
  password: string;
  code: string;

  constructor() {
    this.username = '';
    this.email = '';
    this.password = '';
    this.code = 'UDEMYANDROID';
  }
}

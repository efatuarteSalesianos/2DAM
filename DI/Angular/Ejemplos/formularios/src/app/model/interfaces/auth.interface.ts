  export interface AuthLoginResponse {
    token: string;
    username: string;
    email: string;
    photoUrl: string;
    created: Date;
    active: boolean;
  }

  export interface AuthRegisterResponse {
    token: string;
    username: string;
    email: string;
    role: string;
    photoUrl: string;
    created: Date;
    active: boolean;
}


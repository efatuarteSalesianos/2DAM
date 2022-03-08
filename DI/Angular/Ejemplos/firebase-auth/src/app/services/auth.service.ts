import { Injectable } from '@angular/core';
import { Router } from "@angular/router";
import { getAuth, GoogleAuthProvider } from 'firebase/auth';

const provider = new GoogleAuthProvider();
const auth = getAuth();
const signInWithPopup = () => auth.signInWithPopup(provider);

@Injectable({
  providedIn: 'root'
})

export class AuthService {

  constructor(public router: Router) { }

  // Sign in with Google
  googleAuth() {
    return this.authLogin(provider);
  }

  // Auth logic to run auth providers
  authLogin(provider: GoogleAuthProvider) {
    return signInWithPopup();
  }

}



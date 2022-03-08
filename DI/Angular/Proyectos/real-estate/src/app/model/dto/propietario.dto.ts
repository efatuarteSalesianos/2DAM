export class PropietarioDTO {
  nombre: string;
  apellidos: string;
  direccion: string;
  email: string;
  telefono: string;
  avatar: string;

  constructor() {
      this.nombre = '';
      this.apellidos = '';
      this.direccion = '';
      this.email = '';
      this.telefono = '';
      this.avatar = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png';
  }
}

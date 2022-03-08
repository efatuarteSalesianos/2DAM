import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fill,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Nombre de Usuario',
                      labelText: 'Usuario *'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe introducir un nombre de usuario';
                    } else if (value.length < 5) {
                      return 'El usuario debe tener al menos 5 caracteres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Introducir Contraseña',
                    labelText: 'Contraseña *',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe introducir una contraseña';
                    } else if (value.length < 5) {
                      return 'La contraseña debe tener al menos 5 caracteres';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Procesando')),
                        );
                      }
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/register'),
                  child: const Text('¿Aún no eres miembro? Regístrate',
                      style: TextStyle(
                          fontFamily: "CormorantGaramond",
                          fontSize: 17,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

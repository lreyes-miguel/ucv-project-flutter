import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Inicio de sesión exitoso, realizar acciones necesarias aquí
      print('Inicio de sesión exitoso: ${userCredential.user!.email}');

      // Navegar a la siguiente página después del inicio de sesión (por ejemplo, Home)
      // Navigator.pushNamed(context, '/home');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new HomePage())
      );

    } catch (e) {
      // Error de inicio de sesión, mostrar mensaje de error o realizar otras acciones de manejo de errores
      print('Error de inicio de sesión: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error de inicio de sesión'),
            content: Text(
                'Ocurrió un error durante el inicio de sesión. Por favor, verifica tus credenciales e intenta nuevamente.'),
            actions: [
              TextButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 150.0,
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => login(context),
                child: Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
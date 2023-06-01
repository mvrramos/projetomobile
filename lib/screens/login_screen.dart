import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Lógica para fazer login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(75, 5, 182, 100),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Lógica para recuperar a senha
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromRGBO(75, 5, 182, 50),
                  ),
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: Color.fromRGBO(75, 5, 182, 100),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Lógica para navegar para a tela de cadastro
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromRGBO(75, 5, 182, 50),
                  ),
                  child: const Text('Cadastrar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

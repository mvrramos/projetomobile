import 'package:flutter/material.dart';
import 'package:projetomobile/models/user_model.dart';
import 'package:projetomobile/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
            child: const Text(
              "CADASTRAR",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Define a cor de fundo do input
                    hintText: "E-mail",
                    hintStyle: const TextStyle(
                        color: Colors.grey), // Define a cor do texto do hint
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty || !text.contains("@")) {
                      return "E-mail inválido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Define a cor de fundo do input
                    hintText: "Senha",
                    hintStyle: const TextStyle(
                        color: Colors.grey), // Define a cor do texto do hint
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text == null || text.isEmpty || text.length < 6) {
                      return "Senha inválida";
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    model.signIn(email: '', onFail: () {  }, onSucess: () {  }, pass: '');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.grey, // Define a cor de fundo do botão
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

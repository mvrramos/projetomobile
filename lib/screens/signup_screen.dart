import 'package:flutter/material.dart';
import 'package:projetomobile/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Criar conta"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Define a cor de fundo do input
                    hintText: "Nome completo",
                    hintStyle: const TextStyle(
                        color: Colors.grey), // Define a cor do texto do hint
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Nome inválido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
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
                  controller: _passController,
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
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Define a cor de fundo do input
                    hintText: "Endereço",
                    hintStyle: const TextStyle(
                        color: Colors.grey), // Define a cor do texto do hint
                  ),
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.isEmpty || text.length < 3) {
                      // Altere o tamanho mínimo para 3 caracteres
                      return "Endereço inválido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> userData = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "address": _addressController.text,
                      };
                      model.signUp(
                        userData: userData,
                        pass: _passController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.grey, // Define a cor de fundo do botão
                  ),
                  child: const Text(
                    "Criar conta",
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

  void _onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Colors.grey,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}

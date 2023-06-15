import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetomobile/models/cart_model.dart';
import 'package:projetomobile/models/user_model.dart';
import 'package:projetomobile/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
              title: 'Sports CBR',
              theme: ThemeData(
                primaryColor: Colors.black,
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}

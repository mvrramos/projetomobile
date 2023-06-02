// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetomobile/firebase_options.dart';
import 'package:projetomobile/screens/home_screen.dart';
import 'package:projetomobile/tabs/home_tab.dart';
import 'package:projetomobile/tabs/home_tab2.dart';
import 'package:projetomobile/tabs/main_tab.dart';
import 'package:projetomobile/tabs/products_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports CBR',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(20, 18, 18, 100),
      ),
      home: MainTab(),
    );
  }
}

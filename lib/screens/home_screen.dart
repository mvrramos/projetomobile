import 'package:flutter/material.dart';
import 'package:projetomobile/tabs/home_tab2.dart';
import 'package:projetomobile/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        Scaffold(
          body: HomeTab2(),
          drawer: CustomDrawer(_pageController),
        ),
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ],
    );
  }
}

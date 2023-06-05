import 'package:flutter/material.dart';
import 'package:projetomobile/tabs/home_tab.dart';
import 'package:projetomobile/tabs/initial_tab.dart';
import 'package:projetomobile/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        Scaffold(
          body: InitialTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Produtos"),
            centerTitle: true,
          ),
          body: const HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}

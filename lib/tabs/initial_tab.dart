import 'package:flutter/material.dart';
import 'package:projetomobile/widgets/custom_drawer.dart';

class InitialTab extends StatelessWidget {
  final _pageController = PageController();

  InitialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(_pageController),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/sportscbr.png',
            )
          ],
        ),
      ),
    );
  }
}

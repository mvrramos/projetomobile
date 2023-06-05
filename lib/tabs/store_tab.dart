import 'package:flutter/material.dart';

class StoreTab extends StatelessWidget {
  // final _pageController = PageController();

  const StoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: _pageController,
      appBar: AppBar(
        title: const Text("Loja"),
        backgroundColor: Colors.black,
      ),
    );
  }
}

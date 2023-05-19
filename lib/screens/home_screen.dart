// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:projetomobile/tabs/home_tab.dart';
import 'package:projetomobile/tabs/home_tab2.dart';
import 'package:projetomobile/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  // final _pageController = PageController();
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Scaffold(
          body: HomeTab2(),
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}

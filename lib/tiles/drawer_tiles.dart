import 'package:flutter/material.dart';
import 'package:projetomobile/tabs/category_tab.dart';
import 'package:projetomobile/tabs/initial_tab.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  const DrawerTile(this.icon, this.text, this.controller, this.page, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (page.round() == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InitialTab(),
              ),
            );
          }
          if (page.round() == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryTab(),
              ),
            );
          }
          if (page.round() == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Container(color: Colors.white),
              ),
            );
          }
          if (page.round() == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Container(color: Colors.blue),
              ),
            );
          }
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Icon(icon, size: 32, color: Colors.white),
              const SizedBox(width: 32),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

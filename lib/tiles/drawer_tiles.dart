import 'package:flutter/material.dart';

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
          Navigator.of(context).pop(); // Fecha o Drawer
          controller.jumpToPage(page -
              1); // Navega para a página correspondente (subtraindo 1 do valor de page)
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Icon(icon, size: 32, color: Colors.black),
              const SizedBox(width: 32),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

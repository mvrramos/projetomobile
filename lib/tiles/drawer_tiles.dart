import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const DrawerTile(this.icon, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 60,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32,
                color: Colors.black,
              ),
              const SizedBox(width: 32.0),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projetomobile/tiles/drawer_tiles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(75, 5, 182, 100),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    }

    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: const EdgeInsets.only(left: 18, top: 16),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 8),
                height: 170,
                child: Stack(
                  children: [
                    const Positioned(
                      top: 8,
                      left: 0,
                      child: Text("Sports CBR",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Olá, ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se >",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const DrawerTile(Icons.home, "Inicio"),
              const DrawerTile(Icons.list, "Produtos"),
              const DrawerTile(Icons.featured_play_list, "Meus pedidos"),
            ],
          ),
        ],
      ),
    );
  }
}

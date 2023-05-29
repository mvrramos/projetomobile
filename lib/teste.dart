import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  const CustomDrawer(this.pageController, {Key? key}) : super(key: key);

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
            controller: pageController,
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
                                fontWeight: FontWeight.bold,
                              ),
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
              DrawerTile(Icons.home, "Inicio", pageController, 0),
              DrawerTile(Icons.location_on, "Loja", pageController, 1),
              DrawerTile(
                  Icons.featured_play_list, "Meus pedidos", pageController, 2),
            ],
          ),
        ],
      ),
    );
  }
}

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
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32,
                color: controller.page == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
              ),
              const SizedBox(width: 32),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: controller.page == page
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

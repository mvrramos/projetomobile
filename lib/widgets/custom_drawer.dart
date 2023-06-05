import 'package:flutter/material.dart';
import 'package:projetomobile/screens/login_screen.dart';
import 'package:projetomobile/tiles/drawer_tiles.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  const CustomDrawer(this.pageController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildDrawerBack() {
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(73, 5, 182, 25),
          // gradient: LinearGradient(
          //   colors: [
          //     Color.fromRGBO(75, 5, 182, 100),
          //     Colors.white,
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
      );
    }

    return Drawer(
      child: Stack(
        children: [
          buildDrawerBack(),
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
                      child: Text(
                        "Sports CBR",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            child: const Text(
                              "Entre ou cadastre-se >",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Função para acessar a página de login/cadastro
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.checkroom, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Loja", pageController, 2),
              DrawerTile(
                  Icons.featured_play_list, "Meus pedidos", pageController, 3),
            ],
          ),
        ],
      ),
    );
  }
}

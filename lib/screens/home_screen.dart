import 'package:flutter/material.dart';
import 'package:projetomobile/tabs/home_tab.dart';
import 'package:projetomobile/tabs/orders_tab.dart';
import 'package:projetomobile/tabs/places_tab.dart';
import 'package:projetomobile/tabs/products_tab.dart';
import 'package:projetomobile/widgets/cart_button.dart';
import 'package:projetomobile/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: const CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: const ProductsTab(),
          floatingActionButton: const CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Lojas"),
            centerTitle: true,
          ),
          body: const PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Meus Pedidos"),
            centerTitle: true,
          ),
          body: const OrdersTab(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:projetomobile/models/cart_model.dart';
import 'package:projetomobile/models/user_model.dart';
import 'package:projetomobile/screens/login_screen.dart';
import 'package:projetomobile/screens/order_screen.dart';
import 'package:projetomobile/tiles/cart_tile.dart';
import 'package:projetomobile/widgets/cart_price.dart';
import 'package:projetomobile/widgets/discount_card.dart';
import 'package:projetomobile/widgets/ship_card.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Meu carrinho"),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  "$p ${p == 1 ? "ITEM" : "ITENS"} ",
                  style: const TextStyle(fontSize: 17),
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Faça o login para adicionar os produtos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18),
                      selectionColor: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          } else if (model.products.isEmpty) {
            return const Center(
              child: Text(
                "Nenhum produto no carrinho",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView(
              children: [
                Column(
                  children: model.products.map((product) {
                    return CartTile(product);
                  }).toList(),
                ),
                const DiscountCard(),
                const ShipCard(),
                CartPrice(() async {
                  String? orderId = await model.finishOrder();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => OrderScreen(orderId!),
                  ));
                }),
              ],
            );
          }
        },
      ),
    );
  }
}
